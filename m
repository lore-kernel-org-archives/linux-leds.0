Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC8A3BD63D
	for <linux-leds@vger.kernel.org>; Mon, 30 Mar 2026 10:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774865663; cv=none; b=fbSzVNNYqz/Il+3TF9Lq/5Dl/6AlaSAEgykhQRHHVxydcOKNGX++uvkuY4e6Eg6SplP/oPDEA9DRQYFx/K4PHsEpLJt/bDiZfGgPT0+2Vaivmx0ehqMgT9XC+edPDnvIrjqpCknkIbkIBBfs1aOppbWjDcb0NJdQd5HpcjaAfGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774865663; c=relaxed/simple;
	bh=VNUz0WiHOuF9ZjXRU42hQEkj+M2Tlz+LSPf+IMOY+mA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ap23Lib/+u4YbgmmlcvYhhQsZXYjh9msh8b/saLLddmueoqTMpoZcPTE2MH9hwS6DUynaBpM2bd4/oMOd2huLr3HeZccFUHmu6coTw+P7f1BdDYlzjZVk9mRY6nPUDgu+d20RUqewX6+bvaFbopfiRZSfAcO4duCGnOFfvKM4yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CWe9PHJ/; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CWe9PHJ/"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-82c70e4654eso1779699b3a.2
        for <linux-leds@vger.kernel.org>; Mon, 30 Mar 2026 03:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774865661; x=1775470461; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6X2KX1P20FWcEf3JZUQZZD6U+N7BccVzrtbGiYYMsJc=;
        b=CWe9PHJ/Z07fS7sJXYXBwcKQ6K25SqQ0gFjPrviJkM9+c6u6Q2VoBztAUytk/4hxAI
         Si4r3RT9iEAb2+zyEw9vQMxPQWhkLS9KlqNFPdhOR9c8Jh/CsdPZ3v1vyzu+jRhWEsg8
         puq6DKhY+WgMt5vnjiETwUVn9Oyyb0yDOSbmmQiN6ybXF6jER4PBPee7z1CuPeCs+WYV
         yKDoHutsM43HJssmPwPy07ya3uobbN8HPMi0HkKUrBcXZIOuvSkiDuETk6wxifo0Y/02
         1GX/K2fBER0HjiIdkJro6yPnNuSwyIKWQSVC2Q0QnuDSBzyOMFf8U+IyVldFySPulEHc
         gtIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774865661; x=1775470461;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6X2KX1P20FWcEf3JZUQZZD6U+N7BccVzrtbGiYYMsJc=;
        b=ejVK2yUsdztwWtuQ4oiWgJTmcjT7YukAb3g2tivK+TWtbbFjS8x25XWJBBsRfdmoNG
         jmq3FMrNR3hJ1VtqqWbdXG1fMjOfYSmSyRj9iBpHJ/fPJJ1QTmt5iLjAjEN8XAeYVD/X
         jzUvItuiJGjYEE/8+nnT2XGULKOFMmwnz1eS8kwckV6O6LvFnA9kXPRu7AiytPFwlyLN
         6WFT8fkBEhWH8G88IMSYuMYmlLwnRmz+0RZgKzKYtRMskzgBkHB45xXEmdSxHCcAaM/F
         7dh48dG/gVhP4eJ2cS694XQ0S5vwGX2AMgY3JKGxuq1uUW5fIewg05nPln64KsZCBOih
         wZ3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUjF/qb/VkDcN1WIlWRwW5MfY7/EZBR4yRxAiiXhdbGmhuTEYuC7SJjx5+QIgP6LE7VnSswEXO4OGcd@vger.kernel.org
X-Gm-Message-State: AOJu0YwmmvvcX3rDEp8XR3B/Z8wj/CCiW+1jNGFknyk6mgDz/XSIKy8S
	OagR1nLDhfW+xVctsozIjlq0O0zXr5dsrYFLi8BRjR2EHMf3ibFX0UFk
X-Gm-Gg: ATEYQzz6c1+3Kzn21FOKcZ7MfFiI4/GzEKvNwuErl+SN0bi9URpx9n6lCX1zwCsoSR4
	DFGCAPMJjtuA+XHzRJrTtT5vIW4apq8OE2d3ElciPlX6TgqNjt7V/Tq2mXE37aKqqlEeRCVfLGM
	d9hIjlYCl9oY+naK9GHCsWya0mxAZq9xZD+huo9/a7jIQ0NDxr74IJmEhr+eU6dGY7n7/+H39rc
	0jjAYCbAqtwavWSBW7p8CwrtjwN7QLavfldtbpX1fc1sjvFjy2LJO5VnzfXJu1KZtRt+c7Zc4wb
	PR2YAjjTjtkvAoQGalk5Q4QVlWgEpa0X7rpAzYctaNJSJIaKTVsjiwh8aYE52f4yd5rRYgLxJm2
	04QnoE/l+ai+ihRL6b5mWtMkBeZnjWwoSVc82vniz2+pqCu0Y74iSfiuEssRwxJrIG+K1fsGHv9
	JWFE1yeE4MOjcnfi7kqfUxq2iN/RKo
X-Received: by 2002:a05:6a00:2d22:b0:829:7e6d:cf19 with SMTP id d2e1a72fcca58-82c9604e3eamr12068833b3a.48.1774865661480;
        Mon, 30 Mar 2026 03:14:21 -0700 (PDT)
Received: from [192.168.0.101] ([43.226.29.240])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-82ca843d8e5sm8286080b3a.5.2026.03.30.03.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:14:21 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Subject: [PATCH v3 0/7] Add vibrator, IR transmitter and USB-C handling in
 xiaomi-ginkgo
Date: Mon, 30 Mar 2026 10:13:47 +0000
Message-Id: <20260330-ginkgo-add-usb-ir-vib-v3-0-c4b778b0d7f8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNyw7CIBBFf8WwdgylgI+V/2FcQJni+GgNWKJp+
 u9C3bgxLk9y7zkjixgII9stRhYwUaS+y1AvF6w5mc4jkMvMBBea10KBp+7iezDOwRAtUIBEFqR
 RlXXbttXSsvy9B2zpOXsPxw/HwZ6xeRRZWZwoPvrwmsOpKrt/jVQBByl1o3GjlXF672+Grqumv
 7HSSOLbsv1lEdmyWXPka6lQKfy2TNP0BhIniOgSAQAA
X-Change-ID: 20260325-ginkgo-add-usb-ir-vib-4a51bd9ff64b
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Biswapriyo Nath <nathbappai@gmail.com>, 
 kernel test robot <lkp@intel.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774865654; l=1678;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=VNUz0WiHOuF9ZjXRU42hQEkj+M2Tlz+LSPf+IMOY+mA=;
 b=6qtUaGdDI9jVxrq7nw0ul7y7KHNjMnLjk9RJWUW6JooNXQCD3dMrFQbkk1HrPWfdOVoV8A77P
 ZbKn+kiOMLzBEVGgmMWp6/e32akF66p3yDZa9ZZuwmlCNEb8Uf2gLJp
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=

This patch series add support for various components in Xiaomi Redmi
Note 8.

Most notably:
- IR transmitter
- USB-C OTG
- Vibrator

Also, fix some bindings warning as reported due to previous commits.
These are tested with linux-next tag next-20260320.

Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
Changes in v3:
- Fix dispcc-sm6125 binding by adding qcom,gcc reference.
- Link to v2: https://patch.msgid.link/20260329-ginkgo-add-usb-ir-vib-v2-0-870e0745e55e@gmail.com

Changes in v2:
- Move bindings fixes to first in the series and add fixes tag.
- Link to v1: https://patch.msgid.link/20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com

---
Biswapriyo Nath (7):
      arm64: dts: qcom: sm6125: Use 64 bit addressing
      dt-bindings: clock: qcom,sm6125-dispcc: reference qcom,gcc.yaml
      arm64: dts: qcom: sm6125-xiaomi-ginkgo: Enable vibrator
      arm64: dts: qcom: sm6125: Enable USB-C port handling
      arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add PMI632 Type-C property
      dt-bindings: leds: irled: ir-spi-led: Add new duty-cycle value
      arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add IR transmitter

 .../bindings/clock/qcom,dispcc-sm6125.yaml         |  17 +--
 .../devicetree/bindings/leds/irled/ir-spi-led.yaml |   2 +-
 .../boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi |  56 +++++++
 arch/arm64/boot/dts/qcom/sm6125.dtsi               | 168 +++++++++++----------
 4 files changed, 154 insertions(+), 89 deletions(-)
---
base-commit: 785f0eb2f85decbe7c1ef9ae922931f0194ffc2e
change-id: 20260325-ginkgo-add-usb-ir-vib-4a51bd9ff64b

Best regards,
--  
Biswapriyo Nath <nathbappai@gmail.com>

