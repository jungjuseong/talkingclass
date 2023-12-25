package org.egovframe.cloud.portalservice.api.lesson;

import lombok.RequiredArgsConstructor;
import org.egovframe.cloud.common.dto.RequestDto;
import org.egovframe.cloud.portalservice.api.lesson.dto.LessonListResponseDto;
import org.egovframe.cloud.portalservice.api.lesson.dto.LessonResponseDto;
import org.egovframe.cloud.portalservice.api.lesson.dto.LessonSaveRequestDto;
import org.egovframe.cloud.portalservice.api.lesson.dto.LessonUpdateRequestDto;
import org.egovframe.cloud.portalservice.domain.lesson.LessonRepository;
import org.egovframe.cloud.portalservice.service.lesson.LessonService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

/**
 * org.egovframe.cloud.portalservice.api.lesson.LessonApiController
 * <p>
 * 레슨 Rest API 컨트롤러 클래스
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
@RestController
public class LessonApiController {

    /**
     * 레슨 서비스
     */
    private final LessonRepository lessonRepository;
    private final LessonService lessonService;

    /**
     * 레슨 페이지 목록 조회
     *
     * @param requestDto 요청 DTO
     * @param pageable   페이지 정보
     * @return Page<LessonListResponseDto> 페이지 레슨 목록 응답 DTO
     */
    @GetMapping("/api/v1/lesson")
     public Page<LessonListResponseDto> findAllByKeyword(RequestDto requestDto, Pageable pageable) {
        return lessonRepository.findAllByKeyword(requestDto, pageable);
    }

    /**
     * 레슨 단건 조회
     *
     * @param lessonId 레슨 번호
     * @return LessonResponseDto 레슨 상세 응답 DTO
     */
    @GetMapping("/api/v1/lesson/{lessonId}")
    public LessonResponseDto findById(@PathVariable String lessonId) {
        return lessonService.findById(lessonId);
    }

    /**
     * 레슨 등록
     *
     * @param requestDto 레슨 등록 요청 DTO
     * @return ContentResponseDto 레슨 상세 응답 DTO
     */
    @PostMapping("/api/v1/lesson")
    @ResponseStatus(HttpStatus.CREATED)
    public LessonResponseDto save(@RequestBody @Valid LessonSaveRequestDto requestDto) {
        return lessonService.save(requestDto);
    }

    /**
     * 레슨 수정
     *
     * @param lessonId  레슨 아이디
     * @param requestDto 레슨 수정 요청 DTO
     * @return LessonResponseDto 레슨 상세 응답 DTO
     */
    @PutMapping("/api/v1/lesson/{lessonId}")
    public LessonResponseDto update(@PathVariable String lessonId, @RequestBody @Valid LessonUpdateRequestDto requestDto) {
        return lessonService.update(lessonId, requestDto);
    }

    /**
     * 레슨 삭제
     *
     * @param lessonId 레슨 아이디
     */
    @DeleteMapping("/api/v1/lesson/{lessonId}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable String lessonId) {
        lessonService.delete(lessonId);
    }

}
