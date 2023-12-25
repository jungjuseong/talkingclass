package org.egovframe.cloud.portalservice.domain.lesson;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.egovframe.cloud.servlet.domain.BaseEntity;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

/**
 * org.egovframe.cloud.portalservice.domain.lesson.LessonRepository
 * <p>
 * 레슨 엔터티
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
@Getter
@NoArgsConstructor
@Entity
@DynamicInsert
@DynamicUpdate
public class Lesson extends BaseEntity {
    /**
     * 의소 코드
     */
    @Id
    @Column(nullable = false, length = 5)
    private String lessonId;

    /**
     * 의소 주제
     */
    @Column(length = 100)
    private String subject;

    /**
     * Exmaple
     */
    @Column(nullable = false, columnDefinition = "longtext")
    private String example;

    /**
     * Step 1
     */
    @Column(nullable = false, columnDefinition = "longtext")
    private String step1;

    /**
     * Step 2
     */
    @Column(nullable = false, columnDefinition = "longtext")
    private String step2;

    /**
     * Step 3
     */
    @Column(nullable = false, columnDefinition = "longtext")
    private String step3;

    /**
     * 빌더 패턴 클래스 생성자
     *
     * @param lessonId 의소코드
     * @param subject 의소주제
     * @param example 대화 예제
     * @param step1  1단계 대화
     * @param step2  2단계 대화
     * @param step3  3단계 대화

     */
    @Builder
    public Lesson(String lessonId, String subject, String example, String step1, String step2, String step3) {
        this.lessonId = lessonId;
        this.subject = subject;
        this.example = example;
        this.step1 = step1;
        this.step2 = step2;
        this.step3 = step3;
    }

    /**
     * 컨텐츠 속성 값 수정
     *
     * @param subject 주제
     * @param example 대화 예제
     * @param step1  1단계 대화
     * @param step2  2단계 대화
     * @param step3  3단계 대화
     * @return Lesson Lesson 엔티티
     */
    public Lesson update(String subject, String example, String step1, String step2, String step3) {
        this.subject = subject;
        this.example = example;
        this.step1 = step1;
        this.step2 = step2;
        this.step3 = step3;

        return this;
    }

}
