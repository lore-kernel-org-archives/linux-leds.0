Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793501790;
	b=pjtnTvVFjnhoL8UMeISwF8mJifeBTiQR7GwMVlZU8uTLs3vVcaFHVajIHTZMf8lJEnXE
	 Q1hi4SAjRnIMwwagDdoeManf0jX+4lJtbeoaljLPRgBWOY+IRHZXwWQR1kvW1wsdYFml1
	 yCpx25xqpS7n16BUXWvdwqOIg/ynL9CCG3dYehQAXfMIXRr1wlzHj6z/8H93Ii1mcNQhd
	 kkj5aavhpM2rm7jaFt7aRapMys4NgROmq3RPZ2qSlgrhIMmqPTM1kSDatUUMtcHBVqMU1
	 xcWXACxHTLSUY2Mx1XP3//HPTN/mMcZwcvPhKOkki76VatgnMSOfFthRM2R2JxaBEgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793501790;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Subject:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=b35EmtfK1EKvhybzB6Pk/nuFlVXOrcpUrmoaBw9PPrM=;
	b=qi+4utZ1bOIiAt4pDMz9KzckxjF3c9tCC6gOQbBoRSSt6YGT2POxOk/HT7z7cd92RRHn
	 4KTiOdl0RDl361aaNYu2o+xNORSEiYf6qZ6Q8QCo3XRNVN26Ly1IG4WgyebKoHvekHKEa
	 FZZa5mPefqkKLx+SmuHEt4hRjDo7RPeIikZmmxPQFEcZOBQtPOE7bwny8KdCYIbJJm4Ox
	 Z2nhnQ02zkG/IFSzFtAvkP7u1ghYNjgNErBA8kC8MEa9FHbyWAO1FqZjR1nVILII93l1k
	 E9LmnOtCp+A4aVVQTCwQ4g/mWFoli0QvTozPWfQ2bG+V5SOf0N03mm8ae3Q9k+eToIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sUlBKPcf;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22715606A325
	for <linux-leds@vger.kernel.org>; Sun,  1 Nov 2026 02:56:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22715606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sUlBKPcf
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e74a32a07fso3399705ad.1
        for <linux-leds@vger.kernel.org>; Sat, 31 Oct 2026 19:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793501789; x=1794106589; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b35EmtfK1EKvhybzB6Pk/nuFlVXOrcpUrmoaBw9PPrM=;
        b=sUlBKPcfkzxGh/KtrfxQxeokLhJUeQ1HpZmh180MfcE/lQOvKs8z6r5wknT4rRZeBk
         Yynci4NL4AHCDq7ExLMWnQV2gFvQMFzQT+bwfpMMOvsPsJ2+9LilP72ZbIbeVjdS9Tq9
         WZsx+UDfk+/jsdJzuUDEJ4sp3uts3cPv/VIb3VYo7zln4x+cdqFtAtLyiyqOOpoLy9mg
         Gop82FBouJtJNx5dV6A4jkxohJ2gx7gC+tKp4KQC0sN2xEjtRt7KNpC4+vDFs6pOGTpO
         Dc42/dRbFCcThkCZhTmFNIzGHcIt2vpdJsx6ZNe3n1rRbEqNdceB1u+3dujVBKS1Q9BX
         bVHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793501789; x=1794106589;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b35EmtfK1EKvhybzB6Pk/nuFlVXOrcpUrmoaBw9PPrM=;
        b=NYlzQsj1vtg5qldhaG1RIIhtshYfXohPzRVgj2WIS/m+YbvShCZ2UFWwebvSli4VTt
         mGuRhPC5JIQQn4lS62ePtCusTG8tkqRv0ilC7nh/oy02yBKHGrhe168mTUBu/TK/sdPP
         WAMwrpqX96DkirnYbCdZo/KXiAvj5lnp2sYe3c3EME6ShdWC8lOMch6APrAbKUu3Z8Zu
         dA74NlVcKXdiwll0WA4KT8CU1Za7rJD+iCmvdMFJsZZw+UFrlje1twQRlqtVbbfBr3Qy
         2cGzWNf+wcyRdwbENfL0cKjSZ2TYTtULrwKcK4Ye5Ug8RyoiKKt8Da1KxvC6rHgni4Nk
         1RAA==
X-Gm-Message-State: APuU4Z/srg9jwiQpSiLLD5EGVmpcErd5rf7ecbbdWtpp30Ur4m2Oy9Bk
	IBS3/7KR5JubAqAq26QQ+lugJQUSIT4MK2BkhG4je6NV8mT9t42Sn69HdNJpaJEt
X-Gm-Gg: AYBFou3TFy5FsvFJFxNJqiInS6oIckJnvVOBTff4erqdnoXSIxNhwid+gRQU8On1UB0
	J/4ir2IBp/P0AcuNsnZQtZYfDEMRPHDU1PiX2HyZxZyYNQZZvaKDEfJR5RFTSBNINalJyqXirw0
	/vgqJnB8MDPOOQH8S2RSECs+UbOGeeC1e3J5o/Ru40nxvdS4f9baDzzss7wMWHkMOtkXv74lAJi
	f8JFMRr+Dm0zZYBwKw2c8TZSlriKxY+DkkqaqGatWWKD2Q6vkcwzTMcNOhKfPwa1FKgSED1LBMz
	sxxE4nMhc8dOKQef7H8F5A4nZ6QcUm2Az0K8aCzSbppLzl8OF1NMvvIlIDZOeWtF8QhFDAzEDSe
	9vDs+eiNT2hcx79YuP6xeb53/REr6ZOJD+VBcAjQagatr/WtUXWns5pmBW4eZ6m5ze8PVYCdION
	1MRBaT0OYyxUR4k84G2+YcuV6z1PON8L+Q2aP3BbMjazfl4/I3XnBv2ud/Im4qKTOS/juO79VFg
	H9e1rWXksANo9b71bG0M0E4nH1uP+ux8joC+LG/q9rrGPF5vJSCYEDkbxTM2fFFOzMHDzgRS2fG
	mEVwdNhqoGTiCXjzGBDwrXftSDeL0qge39pTiQIi2jliQaFp05yM4rHPx5PKBY42K0Yvys+tPEg
	U9VySz4OweITS9fflNBozv4PcCV7vdwA1btos3QaXQmin6HxyblDL/e903cqi7qZTS/j6VZVSl9
	0=
X-Received: by 2002:a17:90b:4c84:b0:3a6:e61f:749d with SMTP id 98e67ed59e1d1-3ae89573d2emr9689378a91.1.1793501789387;
        Sat, 31 Oct 2026 19:56:29 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([180.213.195.183])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e9426ffsm13865947a91.7.2026.10.31.19.56.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 31 Oct 2026 19:56:27 -0700 (PDT)
From: Ch1rpy <ch1rpys0116@gmail.com>
To: linux-leds@vger.kernel.org, lee@kernel.org, pavel@kernel.org
Subject: [PATCH 1/2] leds: flash: qcom: correct the cleanup indexing
Date: Sun, 01 Nov 2026 10:56:25 +0800
Message-ID: <179350178518.4281.3598581494157134937@gmail.com>
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
Content-Transfer-Encoding: 8bit

The cleanup of the flash controller walks the registered LEDs and frees
the slots it finds. It counted the entries first and decremented the
count before it used the index, so the last entry was left registered
and the next registration reused the slot.

Do not stop the cleanup on a NULL slot: torch-only LEDs and
configurations without the V4L2 wrapper may leave NULL entries, which
v4l2_flash_release() already accepts.

Fixes: 96a2e242a5dc ("leds: flash: qcom: Fix cleanup of LED flash
device on the platform with multiple LEDs")

Original patch by slwyts <slwyts@foxmail.com>.
Link: https://github.com/slwyts/Project-SunUEFI/commit/34a31774179abd53cb226e3726ed1f6234edcc82

Signed-off-by: Ch1rpy <ch1rpys0116@gmail.com>
---
 drivers/leds/flash/leds-qcom-flash.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/flash/leds-qcom-flash.c b/drivers/leds/flash/leds-qcom-flash.c
index b03a6833e3e3..b5844504aefb 100644
--- a/drivers/leds/flash/leds-qcom-flash.c
+++ b/drivers/leds/flash/leds-qcom-flash.c
@@ -654,7 +654,11 @@ qcom_flash_intensity_to_led_brightness(struct v4l2_flash *v4l2_flash, s32 intens
 	if (!current_ma)
 		return LED_OFF;
 
-	return (current_ma * LED_FULL) / led->max_torch_current_ma;
+	/* brightness_set() converts back with integer division. Round this
+	 * encoding up so an exact 5mA/channel control step is not lost to a
+	 * second truncation. The PMIC still rounds current down to its step.
+	 */
+	return DIV_ROUND_UP(current_ma * LED_FULL, led->max_torch_current_ma);
 }
 
 static s32 qcom_flash_brightness_to_led_intensity(struct v4l2_flash *v4l2_flash,
@@ -662,8 +666,19 @@ static s32 qcom_flash_brightness_to_led_intensity(struct v4l2_flash *v4l2_flash,
 {
 	struct led_classdev_flash *fled_cdev = v4l2_flash->fled_cdev;
 	struct qcom_flash_led *led = flcdev_to_qcom_fled(fled_cdev);
+	u32 current_ma, steps;
+
+	if (!brightness)
+		return 0;
 
-	return (brightness * led->max_torch_current_ma * UA_PER_MA) / LED_FULL;
+	/* Mirror brightness_set() then set_flash_current(): the total mA are
+	 * split per channel, and ITARGET=0 is a nonzero 5mA minimum. Return the
+	 * quantized total, not the unrepresentable LED scale fraction. Thermal
+	 * limiting can still reduce the current during brightness_set().
+	 */
+	current_ma = brightness * led->max_torch_current_ma / LED_FULL;
+	steps = (current_ma * UA_PER_MA / led->chan_count + 1) / TORCH_IRES_UA;
+	return max_t(u32, steps, 1) * TORCH_IRES_UA * led->chan_count;
 }
 
 static const struct v4l2_flash_ops qcom_v4l2_flash_ops = {
-- 
2.54.0 (Apple Git-157)

