Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795181183;
	b=tItqR4JHI04h7E5vl66f2SOLDVkd/4fM1RNGMioTKtNF3fxy28rA3HRYZN3BN8qy9aMH
	 OX4e4V1PvnLThHEIT15QPxspItL7sKbSFxie47+BKZ92aAsrnFAOVPBziWAErdshr2nnr
	 HijqqgSePkgqkOURusHim5uKbqAUfCQGQMJA7Y4WYZ6qwKtci2PXvlOhq6lj7YTnRGpNo
	 Wxu7av/h0HKnWO7Nxdf0umMKwkqEDM4Od9UMXE849Lqxnv3Twk4aFYF8JzWFVL122Yg0O
	 +rdjDYSQSPS4v1RdTmhbyaLGEByea/UeIBM33/CZPdxtuBNfEUF8uAxpiPznEowzhww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795181183;
	h=DMARC-Filter:Received:DKIM-Signature:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Rspamd-Queue-Id;
	bh=/e5lBMNpj6or+OIOfChhWkGzIO01Wzogb03lZ7eoank=;
	b=wUqcNKEM7G/FZe9RE7a7MUc7s9Xm1/eE4iir3WgjK44z+To2QjxILzNPwkb+2iAXTZZt
	 E39GZNJ+E7SDfojxFP1hCKsKpxsu0dKqDaKigsi3zBU3DttTIdcygJIbNAP1JP055JrnU
	 anSVtkXjg4oId8n0kC70p/kNX8IEe415rbatIZTmjXqcO3cIXpZJMR44yT/Dg/ae0aek5
	 vqabmz+O/IFb2wzVEI3dkWR7M+3RvFxd6Un0QYS1AxnpeaGQ2S81KX8vqdMlAkQ9uzCNN
	 DULhCuCfD70k7rThIrWKXP6t4rrTajlNpEQyEm9UBAh79yT+KJLzsGfMePLvcWdCybA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amieiro.net;
	spf=pass smtp.mailfrom=amieiro.net;
	dkim=pass header.d=amieiro.net header.i=@amieiro.net header.a=rsa-sha256 header.s=MBO0001 header.b=jLnMKADr;
	arc=none smtp.remote-ip=80.241.56.152
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B659B60A2600;
	Fri, 20 Nov 2026 13:26:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B659B60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amieiro.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amieiro.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amieiro.net header.i=@amieiro.net header.a=rsa-sha256 header.s=MBO0001 header.b=jLnMKADr
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4jWGLm4VGWzKvdJ;
	Fri, 20 Nov 2026 14:26:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amieiro.net; s=MBO0001;
	t=1795181168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/e5lBMNpj6or+OIOfChhWkGzIO01Wzogb03lZ7eoank=;
	b=jLnMKADraiV7WKPzCT4Zq//TxK30zFpMo4uR+hD2oz7NoV62/mA3jlgua2cUMrX5JD1tdT
	PKOBjS3VNuVocOzU7qLb7DRD2rqoqoedAaBekmtIlNYh2T+2NnrtCPEoioqGOTvEfegF2U
	YpVT3nFeESjIdbyjCvht8URN4TwDAPtX+dEFhZPevAn4Q5xRIhCyHWJScb5L1Q4STX7A/1
	MsG3l1PaA6NZjDy644danV8FyGDY1VxIQZQ+EnU/MO3SJ44uOREf5RhKnk0Gb7s5HB0kTY
	FGPVQMCo51Dyqt+G8fsQrM8hIn9y7xxCAA0ofx3y9QSdPOdQuA3qEdV1MRosfQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of flavio@amieiro.net designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=flavio@amieiro.net
From: Flavio Amieiro <flavio@amieiro.net>
Subject: [PATCH v6 0/2] leds: Add support for the is31fl3206 LED driver
Date: Fri, 20 Nov 2026 10:25:57 -0300
Message-Id: <20261120-add-is31fl3206-support-v6-0-0969fd6292ab@amieiro.net>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43OQU7DMBAF0KtUXmPkmYkdtyvugVg49pgaQRLZa
 QSqcnecIgSiROryS3/en7MonBMXcdidReY5lTT0NZi7nfBH1z+zTKFmgQoNKEDpQpCpEMRXQmV
 kOY3jkCcZtG6jNeT2rRP1eMwc0/sFfnz6yuXUvbCfVm1tHFOZhvxxWZ5h7X2P0NbIDFJJZb0yx
 ntsIDy4t8QpD/c9T2KdmfE2CCvknQrYRd1aitcQ3QZRhYxxrUFHHvAfqPkFod2EmgoxEXjmffQ
 dXUP6BwJoNiFdISIMnVVIFP58tCzLJ9hiFDT0AQAA
X-Change-ID: 20261012-add-is31fl3206-support-d557f863a97a
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Griffin Kroah-Hartman <griffin@kroah.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Flavio Amieiro <flavio@amieiro.net>, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3010; i=flavio@amieiro.net;
 h=from:subject:message-id; bh=A2n4vIlTox3LEYeqUJ5lkogOSfol1epnFYYQ67ZFqDo=;
 b=owGbwMvMwCX2bmrBFGnZ5lDG02pJDNkMXhn332iIL9r07Caj3o/cnXzzra9JxS3tbF/EN4Pr7
 fFjar+fd5SyMIhxMciKKbKwlLGUebcfbN49bbUkzBxWJpAhDFycAjCRlJ0M/8NiN2lvfC9/V99V
 k23Kc7Hyh1ellxvLG2aK+kzrufB3vTkjw9+NbfHpUtofJHX5VB9YxZzP0epl+sv586zZzyNBZU2
 iDAA=
X-Developer-Key: i=flavio@amieiro.net; a=openpgp;
 fpr=047604764B87C183BB96AB19EE9570941B1D8355
X-Rspamd-Queue-Id: 4jWGLm4VGWzKvdJ

This patch series adds support for the is31fl3206 LED driver to the
already existing is31fl32xx driver.

The main difference between this specific variant and the others in
the series is that the LED Control Register controls not only the
enable status of the channel, but also the maximum output current for
it.

This patch allows the chipdef to define at which offset the LED enable
bits are inside the LED Control Register, so when calculating the
value to write to the register we can offset it to the correct
position in the register for ICs like the IS31FL3206.

The patches keep the behavior of the drivers for the other ICs in the
family: initializing the LEDs by enabling all of them and setting
output current to maximum and then using only the PWM registers to
control the brightness of the LEDs.

Signed-off-by: Flavio Amieiro <flavio@amieiro.net>
---
Changes in v6:
- Move value shift statement out of the declaration block
- Move for loop variable initialization to the loop itself
- Add spaces around operator in GENMASK (suggested by checkpatch.pl --strict)
- Link to v5: https://patch.msgid.link/20261114-add-is31fl3206-support-v5-0-332db80233df@amieiro.net

Changes in v5:
- Fix spelling in the documentation for the new attribute
- Rebase onto newest for-leds-next
- Use assignment operator for left shift
- Remove unecessary line wrap
- Link to v4: https://patch.msgid.link/20261028-add-is31fl3206-support-v4-0-e331cee9fcb3@amieiro.net

Changes in v4:
- Changes approach from pointers to functions (used in v3) to
  describing the LED control register layout.
- Link to v3: https://patch.msgid.link/20261013-add-is31fl3206-support-v3-0-66a762a3c12f@amieiro.net

Changes in v3:
- Reorganizes the commits so the dt-bindings are documented before using
  them
- Link to v2: https://patch.msgid.link/20261013-add-is31fl3206-support-v2-0-ca0d2bf5783f@amieiro.net

Changes in v2:
- Avoid double initialization when enable_all_channels is non-NULL
- Add missing entry in the i2c_device_id table
- Link to v1: https://patch.msgid.link/20261013-add-is31fl3206-support-v1-0-08c066cc241d@amieiro.net

To: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@kernel.org>
To: Griffin Kroah-Hartman <griffin@kroah.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-leds@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Flavio Amieiro (2):
      dt-bindings: leds: Add issi,is31fl3206 to leds-is31fl32xx
      leds: is31f132xx: Add support for is31fl3206

 .../devicetree/bindings/leds/leds-is31fl32xx.txt   |  1 +
 drivers/leds/leds-is31fl32xx.c                     | 32 +++++++++++++++++++---
 2 files changed, 29 insertions(+), 4 deletions(-)
---
base-commit: 4e88404a72e5e26720539e5555c383069cefb486
change-id: 20261012-add-is31fl3206-support-d557f863a97a

Best regards,
--  
Flavio Amieiro <flavio@amieiro.net>

