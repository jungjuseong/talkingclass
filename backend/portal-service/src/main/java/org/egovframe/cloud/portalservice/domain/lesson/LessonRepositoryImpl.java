package org.egovframe.cloud.portalservice.domain.lesson;

import org.egovframe.cloud.common.dto.RequestDto;
import org.egovframe.cloud.portalservice.api.lesson.dto.LessonListResponseDto;
import org.egovframe.cloud.portalservice.api.lesson.dto.QLessonListResponseDto;
import org.egovframe.cloud.portalservice.domain.user.QUser;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.support.PageableExecutionUtils;

import com.google.common.base.CaseFormat;
import com.querydsl.core.QueryResults;
import com.querydsl.core.types.Order;
import com.querydsl.core.types.OrderSpecifier;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.BooleanExpression;
import com.querydsl.core.types.dsl.Expressions;
import com.querydsl.jpa.JPQLQuery;
import com.querydsl.jpa.impl.JPAQuery;
import com.querydsl.jpa.impl.JPAQueryFactory;
import static org.springframework.util.StringUtils.hasLength;

import java.util.List;

import lombok.RequiredArgsConstructor;

/**
 * org.egovframe.cloud.portalservice.domain.lesson.LessonRepositoryImpl
 * <p>
 * 레슨 Querydsl 구현 클래스
 *
 * @author 정서한
 * @version 1.0
 * @since 2023/12/24
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *     수정일        수정자           수정내용
 *  ----------    --------    ---------------------------
 *  2023/12/24    seohan       최초 생성
 * </pre>
 */
@RequiredArgsConstructor
public class LessonRepositoryImpl implements LessonRepositoryCustom {

    /**
     * DML 생성을위한 Querydsl 팩토리 클래스
     */
    private final JPAQueryFactory queryFactory;

    /**
     * 레슨 페이지 목록 조회
     * 가급적 Entity 보다는 Dto를 리턴 - Entity 조회시 hibernate 캐시, 불필요 컬럼 조회, oneToOne N+1 문제 발생
     *
     * @param requestDto 요청 DTO
     * @param pageable   페이지 정보
     * @return Page<LessonListResponseDto> 페이지 레슨 목록 응답 DTO
     */
    @Override
	public Page<LessonListResponseDto> findAllByKeyword(RequestDto requestDto, Pageable pageable) {
        JPQLQuery<LessonListResponseDto> query = queryFactory
                .select(new QLessonListResponseDto(
                        QLesson.lesson.lessonId,
                        QLesson.lesson.subject,
                        Expressions.as(QUser.user.userName, "lastModifiedBy"),
                        QLesson.lesson.modifiedDate
                ))
                .from(QLesson.lesson)
                .leftJoin(QUser.user).on(QLesson.lesson.lastModifiedBy.eq(QUser.user.userId))
                .fetchJoin()
                .where(getBooleanExpressionKeyword(requestDto));

        //정렬
        pageable.getSort().stream().forEach(sort -> {
            Order order = sort.isAscending() ? Order.ASC : Order.DESC;
            String property = sort.getProperty();

            Path<Object> target = Expressions.path(Object.class, QLesson.lesson, CaseFormat.LOWER_UNDERSCORE.to(CaseFormat.LOWER_CAMEL, property));
            @SuppressWarnings({ "rawtypes", "unchecked" })
			OrderSpecifier<?> orderSpecifier = new OrderSpecifier(order, target);
            query.orderBy(orderSpecifier);
        });

        QueryResults<LessonListResponseDto> result = query
                .offset(pageable.getOffset())
                .limit(pageable.getPageSize()) //페이징
                .fetchResults();

        return new PageImpl<>(result.getResults(), pageable, result.getTotal());
    }

    /**
     * 공통코드 조회조건
     *
     * @param keywordType
     * @param keyword
     * @return
     */
    private BooleanExpression getBooleanExpressionKeyword(RequestDto requestDto) {

        String keywordType = requestDto.getKeywordType();
        String keyword = requestDto.getKeyword();
        
        if (keyword == null || "".equals(keyword)) return null;
            
        if ("subject".equals(keywordType)) {
            return QLesson.lesson.subject.containsIgnoreCase(keyword);
        } 
        else if ("example".equals(keywordType)) {
            return QLesson.lesson.example.containsIgnoreCase(keyword);
        } 
        return null;
    }

}
