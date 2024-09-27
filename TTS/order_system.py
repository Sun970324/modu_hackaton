import speech_recognition as sr
import time
from tts import speak


class OrderSystem:
    def __init__(self):
        self.recognizer = sr.Recognizer()
        self.yes_or_no = ""
        self.order_complete = ""

    def get_audio_input(self):
        """음성 입력을 받아서 텍스트로 변환"""
        with sr.Microphone() as source:
            print("음성을 입력하세요.")
            audio = self.recognizer.listen(source, timeout=10, phrase_time_limit=10)
            return audio

    def recognize_speech(self, audio, method="google"):
        """음성 인식을 실행"""
        try:
            if method == "google":
                result = self.recognizer.recognize_google(
                    audio,
                    language="ko-KR",
                )
            elif method == "whisper":
                result = self.recognizer.recognize_whisper(audio, language="ko")
            else:
                raise ValueError("지원되지 않는 음성 인식 방법입니다.")
            return result
        except sr.UnknownValueError:
            return "오디오를 이해할 수 없습니다."
        except sr.RequestError as e:
            return f"에러가 발생하였습니다. 에러 원인: {e}"

    def yes_no_prompt(self):
        return input("yes/no를 선택: ")

    def start_ordering_process(self):
        """주문 시스템의 메인 프로세스"""
        self.yes_or_no = self.yes_no_prompt()
        try:
            while True:
                if self.yes_or_no == "yes":
                    speak("주문을 도와드리겠습니다.")  # TTS 출력
                    while True:
                        print("주문을 말씀하세요.")
                        audio = self.get_audio_input()
                        order_text = self.recognize_speech(audio)
                        print(f"주문 내용: {order_text}")

                        # TODO: 사용자 음성 Text를 API로 전송하는 부분 구현 (order_text를 API로 전송)
                        # TODO: 주문이 끝났는지 확인하는 추가 논리 필요

                        if "완료" in order_text:
                            self.order_complete = "yes"

                        if self.order_complete == "yes":
                            print("주문이 완료되었습니다.")
                            break
                elif self.yes_or_no == "no":
                    print("인터페이스 주문으로 전환합니다.")
                    # 인터페이스 주문 로직 구현 가능
                else:
                    print("잘못된 응답입니다. 다시 선택해주세요.")

                # 주문 완료 후 다시 Yes/No 선택
                repeat = self.yes_no_prompt()
                if repeat == "no":
                    print("주문 시스템을 종료합니다.")
                    break
        except KeyboardInterrupt:
            print("시스템이 종료되었습니다.")


order = OrderSystem()
order.start_ordering_process()
