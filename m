Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04E33C76BC
	for <linux-leds@vger.kernel.org>; Mon, 20 Jul 2026 10:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784543434; cv=none; b=gt3pKvfDuUjzQ6mHTMko+NB8GabPKu45oNZ1TQ+NCEzH0j4scMy+GqSr2IB9E8QscMRpNewzJmom5OYIrCnzfWvOuTSu09gcfQZPBpovvTbX/BjbSygy7eJ9Nm5eSahTsUHNgDiL/pHtcieL41wLUf1BTilXxjUGmKCpsATGPGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784543434; c=relaxed/simple;
	bh=9v8IcUjat8TEIAwG7AjNbu0pZK52X7TrT1s9XlSPBt0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GpwLhjNdW804ctkTyxr7DQM09LlqfkCqMGntzdIFI8CsviVNoY681sygyNAl6ClJQ+V1kJwiQsUG0bAtl85+Y6yeo9sWu16Yl1olJMsKw6nTX4XDBBmO5W69//JgOmleYOSHVjrRCNIwK7bz0t4If6a4/qQiAictVmJzYU7FyVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mSQqc5t/; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mSQqc5t/"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ccf2360620so58201185ad.3
        for <linux-leds@vger.kernel.org>; Mon, 20 Jul 2026 03:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784543432; x=1785148232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W6kuUw7/fNv5m3n/7oR0Zyz7m4/Uu2x3pL7qRujVGGo=;
        b=mSQqc5t/MFcxx6bU7ftZwFiEJoQQ78rZvAkNLsxmF/9fi3dSmXIDbCa9MGiB0/ceAe
         Q6A1n9XjCRG5frXJyQw3MZq9mGLyZ4EnGd5W989oew1yXlkxf18L9UaUWlH+eZMx9lDL
         nyVwlf9C04AT8x9GYBr1D2x9BOUWoq21kxeLz+OKbAjvmv/MiPYcUP3H5AOhXUHIzNBD
         aHAGIqkDgumCd7cK3LzHNU+74HZruxF5C2wARMfS9ltPqWQrofCmx8h82osYRNbU5mX1
         zR9cnwZhYqDWV/yELZ8egTnHStk7gxabrA1o1VGzl9UIDb223ucxwpvYEfdx8ln61hZu
         1uXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784543432; x=1785148232;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W6kuUw7/fNv5m3n/7oR0Zyz7m4/Uu2x3pL7qRujVGGo=;
        b=Md9t4Y0yQ73dRQF3/QE1tRIu9q4FBnISVCv8iNLdc6bF0rDnZatTshDx/72LlrurKu
         cNc41VfaXNcg1PwWo9SAMWr6B1Bk5/fmGcVHsXgKAZuzq06s4/0rongl+cSdlqHeTNjW
         C5WxnCvPVl9gA4m5/3u8kfnnNZIgBrJuyxDylKo3cVaPgN5s959/F2+ICipnKOp16/az
         D4d8JP20MufcQf9YbGvVej/SREoE/gQVjGD8dhY6iMaGwzHcJzzWSyF5EkkUjjZhxc+P
         aNu9FRhfH+YVjAZ7UiBq0epl59SL8HAsnKyTw3HnYwmer3zhul6YoqKB2GCZrGyNYbVP
         aX4g==
X-Forwarded-Encrypted: i=1; AHgh+Rooi5JNfJ1vPbGZitDj7u8gdU6cW2KWvLzCI0z0PLsoixHJ6RFZNuCchc48xOlNA3/c5rwGCuQKeOij@vger.kernel.org
X-Gm-Message-State: AOJu0YwEUz1u0EvMqdBvBRME+fGszqS08bADeHSbuLokjSfqc4i15cTH
	QB5q1J4ZTFTAZXF1vXTdp0t1+i0vVsZQQ5Vz5240zN+HZTBiGChxT6E=
X-Gm-Gg: AfdE7ckBKQ2gU3fOoIxAKqBgVmZv0YmVbLHpv2GMhfiaBxbL3VlE3M8a5QFceW6pIYD
	RZfvDVKcSmdLU80tEEA5VomvN2nccBQPuIhbmZhfvIulYx3ZwCuEHh754nWS14JTQG9aHipImvj
	Edq8pgyNmDHf/Djuu8e/imHkTaFk0gntaZhyfCNelv0Lnyt56/xk9xi8SRsF0W8BYrL4uWGIHeB
	7Lc+gy7MyV2dztxbHoPYiLvWB2nOg67tEGNiCCM0XO3xh88gZ3udf8K0vt2ME+YdpUzJ/wgWLQD
	PhrSoXaMDel4iH7WxPc0QE4qMzN8HqBbjsfrTL7YkoPHjMJ7WPLH9crTnmKRRxsN7Uh9kUg4voM
	fK4kQ4QjFELJ1N2JkmOD49gsC4hFXMmcYDqRIoHA1t67xIyz1Xex9YoXMM2h5zQtpFYwIwk1dIc
	IReL/mNBiBx2uLUBJt7ml1yIeMYQ==
X-Received: by 2002:a05:6a20:3ca3:b0:3c3:7ecd:72df with SMTP id adf61e73a8af0-3c3ad86ab89mr15283565637.30.1784543431946;
        Mon, 20 Jul 2026 03:30:31 -0700 (PDT)
Received: from t-rex ([2401:4900:c200:8f2e:8d2c:f805:595:9600])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a20c158sm38054425eec.29.2026.07.20.03.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 03:30:31 -0700 (PDT)
From: kr494167@gmail.com
To: lee@kernel.org,
	pavel@kernel.org
Cc: s.trumtrar@pengutronix.de,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	surendra <kr494167@gmail.com>
Subject: [PATCH] leds: lp5860: reject out-of-range channel IDs
Date: Mon, 20 Jul 2026 16:00:17 +0530
Message-ID: <20260720103017.88090-1-kr494167@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: surendra <kr494167@gmail.com>

lp5860_iterate_subleds() detects a channel ID greater than the
hardware limit, but returns the successful result of
fwnode_property_read_u32(). The caller therefore treats the malformed
sub-LED description as valid and uses the invalid ID for register
addressing.

Return -EINVAL when the channel ID is out of range.

Fixes: f0a66563aa2d ("leds: Add support for TI LP5860 LED driver chip")
Signed-off-by: surendra <kr494167@gmail.com>
---
 drivers/leds/rgb/leds-lp5860-core.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/rgb/leds-lp5860-core.c b/drivers/leds/rgb/leds-lp5860-core.c
index e21d5f2302be..75498311b080 100644
--- a/drivers/leds/rgb/leds-lp5860-core.c
+++ b/drivers/leds/rgb/leds-lp5860-core.c
@@ -114,12 +114,18 @@ static int lp5860_iterate_subleds(struct lp5860_led *led, struct led_init_data *
 		}
 
 		ret = fwnode_property_read_u32(led_node, "reg", &channel);
-		if (ret < 0 || channel > LP5860_MAX_LED) {
+		if (ret < 0) {
 			dev_err_probe(led->chip->dev, ret,
 				      "%pfwP: 'reg' property is missing. Skipping.\n", led_node);
 			fwnode_handle_put(led_node);
 			return ret;
 		}
+		if (channel > LP5860_MAX_LED) {
+			dev_err(led->chip->dev, "%pfwP: 'reg' property is out of range.\n",
+				led_node);
+			fwnode_handle_put(led_node);
+			return -EINVAL;
+		}
 
 		led->mc_cdev.subled_info[subled].color_index = color_index;
 		led->mc_cdev.subled_info[subled].channel = channel;
-- 
2.55.0

