import { DetailButtons } from '@components/Buttons'
import CustomAlert from '@components/CustomAlert'
import ValidationAlert from '@components/EditForm/ValidationAlert'
import Editor from '@components/Editor'
import Box from '@material-ui/core/Box'
import Grid from '@material-ui/core/Grid'
import { createStyles, makeStyles, Theme } from '@material-ui/core/styles'
import TextField from '@material-ui/core/TextField'
import { LessonSavePayload, lessonService } from '@service'
import { detailButtonsSnackAtom, errorStateSelector } from '@stores'
import { format } from '@utils'
import { AxiosError } from 'axios'
import { GetServerSideProps } from 'next'
import { useTranslation } from 'next-i18next'
import { useRouter } from 'next/router'
import React, { useState } from 'react'
import { Controller, FormProvider, useForm } from 'react-hook-form'
import { useSetRecoilState } from 'recoil'

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      flexGrow: 1,
      marginTop: theme.spacing(1),
      '& .MuiOutlinedInput-input': {
        padding: theme.spacing(2),
      },
    },
    switch: {
      paddingTop: theme.spacing(1),
      paddingBottom: theme.spacing(1),
      paddingLeft: theme.spacing(2),
      paddingRight: theme.spacing(2),
    },
    buttonContainer: {
      display: 'flex',
      margin: theme.spacing(1),
      justifyContent: 'center',
      '& .MuiButton-root': {
        margin: theme.spacing(1),
      },
    },
    backdrop: {
      zIndex: theme.zIndex.drawer + 1,
      color: '#fff',
    },
  }),
)

interface ILessonFormInput {
  lessonId: string
  subject: string
  example: string
  step1: string
  step2: string
  step3: string
}

export interface ILessonItemsProps {
  lessonId: string
  initData: LessonSavePayload | null
}

const LessonItem = ({ lessonId, initData }: ILessonItemsProps) => {
  const classes = useStyles()
  const route = useRouter()
  const { t } = useTranslation()

  // 버튼 component 상태 전이
  const setSuccessSnackBar = useSetRecoilState(detailButtonsSnackAtom)

  // 상태관리 hook
  const setErrorState = useSetRecoilState(errorStateSelector)

  // alert
  const [customAlert, setCustomAlert] = useState<any>({
    open: false,
    message: '',
    handleAlert: () => setCustomAlert({ open: false }),
  })

  // Editor
  const [example, setExample] = useState<string>(
    initData?.example || '',
  )

  // Editor
  const [step1, setEStep1] = useState<string>(
    initData?.step1 || '',
  )
      // Editor
  const [step2, setEStep2] = useState<string>(
    initData?.step2 || '',
  )

  // Editor
  const [step3, setEStep3] = useState<string>(
    initData?.step3 || '',
  )

  // form hook
  const methods = useForm<ILessonFormInput>({
    defaultValues: {
      subject: initData?.subject || '',
      example: initData?.example || '',
      step1: initData?.step1 || '',
      step2: initData?.step2 || '',
      step3: initData?.step3 || '',
    },
  })
  const {
    formState: { errors },
    control,
    handleSubmit,
  } = methods

  const successCallback = () => {
    setSuccessSnackBar('success')

    route.back()
  }

  const errorCallback = (error: AxiosError) => {
    setSuccessSnackBar('none')

    setErrorState({
      error,
    })
  }

  // handleSubmit 저장
  const handleSave = async (formData: ILessonFormInput) => {
    setSuccessSnackBar('loading')

    const saved: LessonSavePayload = {
      subject: formData.subject,
      example,
      step1,
      step2,
      step3,
    }

    if (!example) {
      setCustomAlert({
        open: true,
        message: format(t('valid.required.format'), [
          t('lesson.example'),
        ]),
        handleAlert: () => {
          setCustomAlert({ open: false })
        },
      })
      return
    }
    if (!step1) {
      setCustomAlert({
        open: true,
        message: format(t('valid.required.format'), [
          t('lesson.step1'),
        ]),
        handleAlert: () => {
          setCustomAlert({ open: false })
        },
      })
      return
    }
    
    if (lessonId === '-1') {
      await lessonService.save({
        callback: successCallback,
        errorCallback,
        data: saved,
      })
    } else {
      await lessonService.update({
        lessonId,
        callback: successCallback,
        errorCallback,
        data: saved,
      })
    }
  }

  return (
    <div className={classes.root}>
      <FormProvider {...methods}>
        <form>
          <Grid container spacing={1}>
            <Grid item xs={12} sm={12}>
              <Box boxShadow={1}>
                <Controller
                  name="subject"
                  control={control}
                  rules={{ required: true, maxLength: 20 }}
                  render={({ field }) => (
                    <TextField
                      autoFocus
                      label={t('lesson.subject')}
                      name="subject"
                      required
                      inputProps={{ maxLength: 25 }}
                      id="outlined-full-width"
                      placeholder={format(t('msg.placeholder.format'), [
                        t('lesson.subject'),
                      ])}
                      fullWidth
                      variant="outlined"
                      {...field}
                    />
                  )}
                />
                {errors.subject && (
                  <ValidationAlert
                    fieldError={errors.subject}
                    target={[100]}
                    label={t('lesson.subject')}
                  />
                )}
              </Box>
            </Grid>
            <Grid item xs={12} sm={12}>
              <Box boxShadow={1}>
                <Controller
                  name="example"
                  control={control}
                  rules={{ required: true, maxLength: 100 }}
                  render={({ field }) => (
                    <TextField
                      label={t('lesson.example')}
                      name="example"
                      inputProps={{ maxLength: 200 }}
                      id="outlined-full-width"
                      placeholder={format(t('msg.placeholder.format'), [
                        t('lesson.example'),
                      ])}
                      fullWidth
                      variant="outlined"
                      {...field}
                    />
                  )}
                />
                {errors.example && (
                  <ValidationAlert
                    fieldError={errors.example}
                    target={[200]}
                    label={t('lesson.example')}
                  />
                )}
              </Box>
            </Grid>
          </Grid>
          <Editor contents={example} setContents={setExample} />
        </form>
      </FormProvider>
      <DetailButtons
        handleList={() => {
          route.back()
        }}
        handleSave={handleSubmit(handleSave)}
      />
      <CustomAlert
        contentText={customAlert.message}
        open={customAlert.open}
        handleAlert={() => setCustomAlert({ open: false })}
      />
    </div>
  )
}

export const getServerSideProps: GetServerSideProps = async ({ query }) => {
  const lessonId = query.id as string

  let data = {}

  try {
    if (lessonId !== '-1') {
      const result = await lessonService.get(lessonId)
      if (result) {
        data = (await result.data) as LessonSavePayload
      }
    }
  } catch (error) {
    console.error(`lesson item query error ${error.message}`)
    if (error.response?.data?.code === 'E003') {
      return {
        notFound: true,
      }
    }
  }

  return {
    props: {
      lessonId,
      initData: data,
    },
  }
}

export default LessonItem
