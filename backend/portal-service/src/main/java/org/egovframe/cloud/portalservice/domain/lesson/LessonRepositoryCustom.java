package org.egovframe.cloud.portalservice.domain.lesson;

import org.egovframe.cloud.common.dto.RequestDto;
import org.egovframe.cloud.portalservice.api.code.dto.CodeListResponseDto;
import org.egovframe.cloud.portalservice.api.lesson.dto.LessonListResponseDto;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

/**
 * org.egovframe.cloud.portalservice.domain.lesson.LessonRepository
 * <p>
 * 레슨 QueryDSL
 *
 * @author 정서한 SEOHAN
 * @version 1.0
 * @since 2023/12/24
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *     수정일        수정자           수정내용
 *  ----------    --------    ---------------------------
 *  2023/12/24    SEOHAN       최초 생성
 * </pre>
 */
public interface LessonRepositoryCustom {

    /**
     * 레슨 페이지 목록 조회
     *
     * @param requestDto 레슨 목록 요청 DTO
     * @param pageable   페이지 정보
     * @return Page<LessonListResponseDto> 페이지 레슨 목록 응답 DTO
     */
    Page<LessonListResponseDto> findAllByKeyword(RequestDto requestDto, Pageable pageable);

}
