package org.egovframe.cloud.portalservice.service.lesson;

import lombok.RequiredArgsConstructor;
import org.egovframe.cloud.common.dto.RequestDto;
import org.egovframe.cloud.common.exception.EntityNotFoundException;
import org.egovframe.cloud.common.service.AbstractService;
import org.egovframe.cloud.portalservice.api.lesson.dto.LessonListResponseDto;
import org.egovframe.cloud.portalservice.api.lesson.dto.LessonResponseDto;
import org.egovframe.cloud.portalservice.api.lesson.dto.LessonSaveRequestDto;
import org.egovframe.cloud.portalservice.api.lesson.dto.LessonUpdateRequestDto;
import org.egovframe.cloud.portalservice.domain.lesson.Lesson;
import org.egovframe.cloud.portalservice.domain.lesson.LessonRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * org.egovframe.cloud.portalservice.service.lesson.LessonService
 * <p>
 * 레슨 서비스 클래스
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
@Transactional(readOnly = true)
@RequiredArgsConstructor
@Service
public class LessonService extends AbstractService {

    /**
     * 레슨 레파지토리 인터페이스
     */
    private final LessonRepository lessonRepository;

    /**
     * 조회 조건에 일치하는 레슨 페이지 목록 조회
     *
     * @param requestDto 요청 DTO
     * @param pageable   페이지 정보
     * @return Page<LessonListResponseDto> 페이지 레슨 목록 응답 DTO
     */
    public Page<LessonListResponseDto> findPage(RequestDto requestDto, Pageable pageable) {
        System.out.println("findPage :" + requestDto.getKeyword() + ":" + requestDto.toString());
        return lessonRepository.findAllByKeyword(requestDto, pageable);
    }

    /**
     * 레슨 단건 조회
     *
     * @param lessonId 의소코드
     * @return LessonResponseDto 레슨 응답 DTO
     */
    public LessonResponseDto findById(String lessonId) {
        Lesson entity = findLesson(lessonId);

        return new LessonResponseDto(entity);
    }

    /**
     * 레슨 등록
     *
     * @param requestDto 레슨 등록 요청 DTO
     * @return LessonResponseDto 레슨 응답 DTO
     */
    @Transactional
    public LessonResponseDto save(LessonSaveRequestDto requestDto) {
        Lesson entity = lessonRepository.save(requestDto.toEntity());

        return new LessonResponseDto(entity);
    }

    /**
     * 레슨 수정
     *
     * @param lessonId  레슨 아이디
     * @param requestDto 레슨 수정 요청 DTO
     * @return lessontResponseDto 레슨 응답 DTO
     */
    @Transactional
    public LessonResponseDto update(String lessonId, LessonUpdateRequestDto dto) {
        Lesson entity = findLesson(lessonId);

        // 수정
        entity.update(dto.getSubject(), dto.getExample(), dto.getStep1(),dto.getStep2(),dto.getStep3());

        return new LessonResponseDto(entity);
    }

    /**
     * 레슨 삭제
     *
     * @param lessonId 의소코드
     */
    @Transactional
    public void delete(String lessonId) {
        Lesson entity = findLesson(lessonId);

        // 삭제
        lessonRepository.delete(entity);
    }

    /**
     * 레슨 번호로 레슨 엔티티 조회
     *
     * @param lessonId 레슨 번호
     * @return Lesson 레슨 엔티티
     */
    private Lesson findLesson(String lessonId) {
        return lessonRepository.findById(lessonId)
                .orElseThrow(() -> new EntityNotFoundException(getMessage("valid.notexists.format", new Object[]{getMessage("lesson")})));
    }

}
