package org.egovframe.cloud.portalservice.domain.content;

import org.springframework.data.jpa.repository.JpaRepository;

/**
 * org.egovframe.cloud.portalservice.domain.content.ContentRepository
 * <p>
 * 컨텐츠 레파지토리 인터페이스
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
public interface ContentRepository extends JpaRepository<Content, Integer>, ContentRepositoryCustom {

}
