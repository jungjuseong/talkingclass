import { Page } from '@utils'
import axios, { AxiosError } from 'axios'
import useSWR from 'swr'
import { common, SearchPayload } from './common'

/**
 * 저장 시 데이터 타입
 */
export interface LessonSavePayload {
  subject: string
  example: string
  step1: string
  step2: string
  step3: string
}

/**
 * request payload
 */
export interface LessonPayload {
  callback: () => any
  errorCallback: (error: AxiosError) => void
  lessonId?: string
  data?: LessonSavePayload
}

/**
 * 포털 서비스 레슨 API URL
 */
const LESSON_URL = '/portal-service/api/v1/lesson'

/**
 * 레슨 관리 서비스
 */
export const lessonService = {
  search: ({ keywordType, keyword, size, page }: SearchPayload) =>
    // eslint-disable-next-line react-hooks/rules-of-hooks
    useSWR<Page, AxiosError>(
      [`${LESSON_URL}?size=${size}&page=${page}`, keywordType, keyword],
      url => common.fetcher(url, { keywordType, keyword }),
      { revalidateOnFocus: false, errorRetryCount: 0 },
    ),
  get: async (lessonId: string) => axios.get(`${LESSON_URL}/${lessonId}`),
  delete: async ({ lessonId, callback, errorCallback }: LessonPayload) => {
    try {
      const result = await axios.delete(`${LESSON_URL}/${lessonId}`)
      if (result) {
        callback()
      }
    } catch (error) {
      errorCallback(error)
    }
  },
  save: async ({ callback, errorCallback, data }: LessonPayload) => {
    try {
      const result = await axios.post(LESSON_URL, data, {
        headers: common.headers,
      })
      if (result) {
        callback()
      }
    } catch (error) {
      errorCallback(error)
    }
  },
  update: async ({
    callback,
    errorCallback,
    lessonId,
    data,
  }: LessonPayload) => {
    try {
      const result = await axios.put(`${LESSON_URL}/${lessonId}`, data, {
        headers: common.headers,
      })
      if (result) {
        callback()
      }
    } catch (error) {
      errorCallback(error)
    }
  },
}
