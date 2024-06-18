<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.itwill.shop.order.Order"%>
<%@page import="com.itwill.shop.user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="user_login_check.jspf"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Simple Payment Form use Bootstrap</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<link rel="stylesheet prefetch"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<link rel="stylesheet prefetch"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/style.css">
<!-- script -->




<script>
	function formatCardNumber() {
		let cardNumberInput = document.getElementById('cardNumber');
		let value = cardNumberInput.value.replace(/\D/g, ''); // 숫자가 아닌 문자열 모두 제거
		let formattedValue = '';

		// 입력 값의 길이를 최대 19자리로 제한
		value = value.slice(0, 16);

		for (let i = 0; i < value.length; i++) {
			if (i > 0 && i % 4 === 0) {
				formattedValue += '-';
			}
			formattedValue += value.charAt(i);
		}

		cardNumberInput.value = formattedValue;
	}
</script>
<script>
	function formatcardCVC() {
		let cardCVCInput = document.getElementsByName('cardCVC')[0];
		let value = cardCVCInput.value.replace(/\D/g, ''); // 숫자가 아닌 문자열 모두 제거
		let formattedValue = '';

		// 입력 값의 길이를 최대 6자리로 제한 (MMYY 형식)
		value = value.slice(0, 3);

		for (let i = 0; i < value.length; i++) {

			formattedValue += value.charAt(i);
		}

		cardCVCInput.value = formattedValue;
	}
</script>
<!-- <script>
	function formatCardExpiry() {
		let cardExpiryInput = document.getElementsByName('cardExpiry')[0];
		let value = cardExpiryInput.value.replace(/\D/g, ''); // 숫자가 아닌 문자열 모두 제거
		let formattedValue = '';

		// 입력 값의 길이를 최대 6자리로 제한 (MMYY 형식)
		value = value.slice(0, 4);

		for (let i = 0; i < value.length; i++) {
			if (i > 0 && i % 2 === 0) {
				formattedValue += ' / ';
			}
			formattedValue += value.charAt(i);
		}

		if (document.getElementsByName('cardExpiry').value = "") {
			alert("카드 정보가 모두 입력되지 않았습니다");
			return;

		}
		cardExpiryInput.value = formattedValue;

	}
</script> -->
<script>
	function formatCardExpiry() {
		let cardExpiryInput = document.getElementsByName('cardExpiry')[0];
		let value = cardExpiryInput.value.replace(/\D/g, ''); // 숫자가 아닌 문자열 모두 제거
		let formattedValue = '';

		// 입력 값의 길이를 최대 6자리로 제한 (MMYY 형식)
		value = value.slice(0, 4);

		for (let i = 0; i < value.length; i++) {
			if (i > 0 && i % 2 === 0) {
				formattedValue += ' / ';
			}
			formattedValue += value.charAt(i);
		}

		cardExpiryInput.value = formattedValue;
	}
</script>




<script type="text/javascript">
	function form_Type(CardType) {
		if (CardType.value === 'mastercard') {
			document.getElementById('cardPaymentForm').style.display = 'block';
			document.getElementById('bankDepositForm').style.display = 'none';
		} else if (CardType.value === 'bankDeposit') {
			document.getElementById('cardPaymentForm').style.display = 'none';
			document.getElementById('bankDepositForm').style.display = 'block';
		}

	}
</script>


<script type="text/javascript">
	function pay_type_to_window() {
		let payType;
		if (document.getElementById('mastercard').checked) {
			payType = window.document.cardPaymentForm.payType.value;
			let cardCVCInput = document.getElementsByName('cardCVC')[0];
			let cardExpiryInput = document.getElementsByName('cardExpiry')[0];
			let cardNumberInput = document.getElementsByName('cardNumber')[0];
			if (cardCVCInput.value === '' || cardExpiryInput.value === '' || cardNumberInput.value === '') {
				alert("카드 정보가 모두 입력되지 않았습니다");
				return;
		 	}
			
		} else if (document.getElementById('bankDeposit').checked) {
			payType = window.document.bankDepositForm.payType.value;
				let cardNameInput = document.getElementsByName('cardName')[0];
			let issueNumberInput = document.getElementsByName('issueNumber')[0]; // 발행번호 입력 요소 */

			 if (!cardNameInput.value || !issueNumberInput.value) {
				alert("정보가 모두 입력되지 않았습니다");
				return;
			} 
		}


		opener.order_create_form.oPayment.value = payType;
		self.close();
	}
</script>


</head>


<body>

	<div class="container">
		<div class="row">
			<div class="col-xs-12 col-md-4">
				<!-- CREDIT CARD FORM STARTS HERE -->
				<div class="panel panel-default credit-card-box">
					<div class="panel-heading display-table"
						style="padding: 20px; margin: 10px">
						<div class="row display-tr">
							<h3 class="panel-title display-td">결제하기</h3>

						</div>
					</div>


					<div class="col-xs-12">
						<label>Card Type:</label>
						<div class="radio">
							<label><input type="radio" name="cardType"
								onchange="form_Type(this);" id="mastercard" value="mastercard"
								checked> 카드</label>
						</div>
						<div class="radio">
							<label><input type="radio" name="cardType"
								onchange="form_Type(this);" id="bankDeposit" value="bankDeposit">
								무통장 입금</label>
						</div>
					</div>
					<div class="panel-body">


						<!-- 카드 폼  -->
						<form role="form" id="cardPaymentForm" name="cardPaymentForm"
							class="payment-form">
							<input type="hidden" name="payType" value="카드">
							<div class="row">
								<div class="col-xs-12">
									<div class="form-group">
										<label for="cardNumber">카드 번호</label>
										<div class="input-group">
											<input type="tel" class="form-control" name="cardNumber"
												id="cardNumber" placeholder="****-****-****-****"
												autocomplete="cc-number" required autofocus
												oninput="formatCardNumber()" maxlength="19" pattern="\d*" />
											<span class="input-group-addon"><i
												class="fa fa-credit-card"></i></span>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-7 col-md-7">
									<div class="form-group">
										<label for="cardExpiry"><span class="hidden-xs"></span><span
											class="visible-xs-inline">EXP</span> 유효기간</label> <input type="tel"
											class="form-control" name="cardExpiry" placeholder="MM / YY"
											autocomplete="cc-exp" required oninput="formatCardExpiry()" />
									</div>
								</div>
								<div class="col-xs-5 col-md-5 pull-right">
									<div class="form-group">
										<label for="cardCVC">CVC</label> <input type="tel"
											class="form-control" name="cardCVC" placeholder="CVC"
											autocomplete="cc-csc" required oninput="formatcardCVC()" />
									</div>
								</div>
							</div>
							<!-- *********************fake**************** -->
							<div class="row" style="visibility: hidden;">
								<div class="col-xs-12">
									<label>Card Type:</label>
									<div class="radio">
										<label><input type="radio" name="cardType"
											value="mastercard" checked> 카드</label>
									</div>
									<div class="radio">
										<label><input type="radio" name="cardType"
											value="bankDeposit"> 무통장 입금</label>
									</div>
								</div>
							</div>



							<div
								style="padding-bottom: 91px; text-align: right; visibility: hidden;">

							</div>
					</div>
				</div>
</form>
		
				


				<!-- 무통장입금 폼 -->
				<form role="form" id="bankDepositForm" name="bankDepositForm"
					class="payment-form" style="display: none;">
					<input type="hidden" name="payType" value="무통장입금">
					<!-- 무통장 입금 폼의 구조 및 필드들 추가 -->

					<tbody id="_payInfo_payType_others">

						<div class="form-group">
							<label for="cardExpiry"><span class="hidden-xs"></span><span
								class="visible-xs-inline"></span> 입금자</label> <input type="text"
								class="form-control" name="cardName" autocomplete="cc-exp"
								value="" id="cardName"  required
								/>
						</div>

						<tr>
							<th scope="row" class="bd0">입금은행</th>
							<td>
								<div class="form-group">
									<label for="bankType">은행 선택</label> <select
										class="form-control" name="bankType" id="bankType">
										<option value="kookmin">국민은행</option>
										<option value="woori">우리은행</option>
										<option value="woori">신한은행</option>
										<option value="woori">농협은행</option>
										<!-- 다른 은행도 추가할 수 있습니다. -->
									</select>
								</div>
							</td>
						</tr>
						<tr>
							<div>
								<label>발행:</label> <label><input type="radio"
									name="CreditType" value="deduction" checked> 개인소득공제용</label> <label><input
									type="radio" name="CreditType" value="PayEvidence">
									지출증빙용</label> <label><input type="radio" name="CreditType"
									value="NotValue"> 미발행</label>
							</div>
						</tr>


						<div class="form-group">
							<label for="cardExpiry"><span class="hidden-xs"></span><span
								class="visible-xs-inline"></span> 발행번호</label> <input type="text"
								class="form-control" name="issueNumber" autocomplete="cc-exp"
								value="" id="issueNumber" required
								/>
							<tr>
								<th scope="row" class="v_top">&nbsp;&nbsp;&nbsp;'-'를 제외한
									휴대폰 번호를 입력해주세요.</th>
							</tr>
						</div>

						<div style="padding: 10px 10px; text-align: right;">
							<tr>
								<th scope="row"><span style="font-weight: 1000">입금기한</span></th>
								<td><em><%=new SimpleDateFormat("yyyy/MM/dd").format(System.currentTimeMillis() + 24 * 60 * 60 * 1000)%>&nbsp;
										23시 59분 59초 까지</em></td>
							</tr>
						</div>




					</tbody>

					<!-- 무통장 입금 폼의 버튼 등 추가 -->
				</form>



				<div class="row">
					<div class="col-xs-12">
						<button class="btn btn-success btn-lg btn-block" type="button"
							onclick="pay_type_to_window();">결제하기</button>
					</div>
				</div>
				<div class="row" style="display: none;">
					<div class="col-xs-12">
						<p class="payment-errors"></p>
					</div>
				</div>
				</form>
			</div>
		</div>
		<!-- CREDIT CARD FORM ENDS HERE -->
	</div>
	</div>
	</div>

	<!-- If you're using Stripe for payments -->
	<script type="text/javascript" src="https://js.stripe.com/v2/"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.13.1/jquery.validate.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery.payment/1.2.3/jquery.payment.min.js"></script>
	<script src="js/index.js"></script>
</body>

</html>
