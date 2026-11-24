Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795514059;
	b=ZKkcGXb3QY9stKxrqcMIAMMPTT/n/EmmQLt3TBXerirHx17mzCNfShYt3Y0+lF0IHlA8
	 Reb2K61Hm2PwPFO5IN8w+U3WEL+Cbe1o/YbLFFr6YHofO3oSMFm3jTb3P0mzHtbg2Y9FA
	 JNW+pMJGmTmYMkSXnd/61w1Os5lk9dcRIc+Wtt9nx1vlQLrdTJmlLHZ4VvqOIwx0I813A
	 KLUFAClyiwaVqrzSarZYet2yvQ5VRQAERbcKaZt9KF5i+YBJ5ch1ZI3nyCEtcCu4vN6pF
	 LW67DwxN8fNQcdjk8kePGQVNkn2R1rz+e/+uNF9NNGNzrZ2GC35IxYep90sMsoGdUaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514059;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fJ3JKeUaCakN7r7cr85UYuo9cA76onoVrZv6mAvryU0=;
	b=I9PsI3VekfAwR0O4crcrP0h68ifeb1LaD3XAH0YIAHUxMAKFNhmEA6EJ0jsUuNdQaE3j
	 uUudWx5TZE1P1dcb9nmW8NwZ7AbO5M6LkPwWn5OF8xJAj+tBT5IZiVzz2chRVG8eWUDX+
	 PLwEb+XnaZIjyUZ6wnGTE5Mi1a7XGc7KVdSH39+ymKHZwgqyOUtmOEN0xzwYfllNX5oSB
	 koWMnjCY7dbPBFJljuDV4XInzNXmePydV+xVj2QqLbBwU1xs9NnN5eTmpkdy89VsqqnZi
	 mAgLzvm3e/iweHKnMDCHsFENzsbtoEDGxhSfd/3rd7lbupVc1XJjKapUkJXvfLU+AfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GYvLW7Et;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D266D606A33D
	for <linux-leds@vger.kernel.org>; Tue, 24 Nov 2026 09:54:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D266D606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GYvLW7Et
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-38587f3de36so5223670eec.0
        for <linux-leds@vger.kernel.org>; Tue, 24 Nov 2026 01:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795514058; x=1796118858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fJ3JKeUaCakN7r7cr85UYuo9cA76onoVrZv6mAvryU0=;
        b=GYvLW7EtY6bkCOR6NvKJ1Hf72uqK0d02l2YNbW2RfH6Dpj8iv+dwbosi7qpatZHZFs
         RPCZlSUNX8kvHUmXiIIcxnyBAlSIxpxLgapSdHmDyajkiBD3xZEdUuATKXoETl/B2Zkf
         GJuDRvL7107dSfetWrSKDsd1DaT5TJC5E/ylpXHf9WW1/n8jwI0UcoQ681i1Ppsmy8gs
         h9MYjWc4q39/qkqJHGxSejLnT9Uqv4ZAX4aMyMmC/X1iyNy4UJNYXscohq/dm0zNzYQj
         YFV0fiwrfwDqoOfnK0ayMRD+m/7++eZzSdt1o4ANTvf8fT0sSk5Msi9SQomxxe866Ryx
         lCGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795514058; x=1796118858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fJ3JKeUaCakN7r7cr85UYuo9cA76onoVrZv6mAvryU0=;
        b=OWzbJ3O3zhNz6MZGT09r6b6hKqNMpTjmazFPoYaaS8OfAG5yTrZRTjMbmjYEg6hW4T
         PnmLG3ZRSJx/UUTWZ+hMe8FT6n+yCfs64c2X4J55UBJYpB1nLhe0SS29h/5PbczdBax+
         X1Do7W10/iRdwDHwspdE5SEUnXFsElw3oatsc8CJmLZZkANgdRAJsrA+0wOlbtDFQfy8
         ctAseR7ZJggfR3j4Vm8FBh0HS6INx6Pw+W2TCIC1isumnnFBL8Mh2VXUV5N9qSm4ghqO
         oA8Jml3E5gXoShnAB5UZcLDrkmwEo4slOjmb5uin/vM5mdoa/dl3LwQP1H+2OfR29SgQ
         dffA==
X-Forwarded-Encrypted: i=1; AL+hErHhLDyPUehYgzKRalBUUlFK+ZL5Jyw/6ZlzHhwA0MoVt9NNJnWGLDLkwNpTQ2fK216C71CcReCxK83+@vger.kernel.org
X-Gm-Message-State: APuU4Z+Cstut7lh39YJkgvKJ10mxd31ZEobXqRLMZkYBhZytsQuZEkYF
	mdVMbI8wQEOWaHn6NCVpMIbo6t4a3TbxXFYGl+Td2xm0MerKmKepyZ7UQcyW7A==
X-Gm-Gg: AZFdTZf7EIBwGAklbNN7YeN9nv/kYweA+d/K7GXysQriFzuPFLmKUauzcrXA8/DUHzR
	qIsnN6EyOm0rMQWD6mZiIGX3tvO+PGXoUD7Q9nE2IHXuuegMYJXF52EE8dmcXYqst/LyXa43Ww9
	cuhMN1HL9YYOp1ulBdpbbEW8B7b7b7d943FB5D9Z/Vm/wH2mz/z+2lH/fr3O7wErkpqtn0Xgc4r
	xb82yvFMkofJksWkFHvWIQpcwbggtt3gewBzF82+wthrEN7/k2S62aZfEj2VRm4AeAhWFwXoq9m
	dIHC0V3XmUC9PpX2mArlzWykmOt2EHc7vuhGeclNu150qrMLq4nAVNtRPpFaSLm3RLB0lNuETHr
	Ey+E+R0MrQQ1kWylpXkrs8EpfeO97CF8S33HLSL3gl8hNC+rR5t6DG/0Ag6OupA3GON1B/LD+Pz
	BHbSVsbcz4/rz+G0YiSlTo0m0GuhQBm+VviJ5HlNzn5WKHO483Rmfto3YJuRYZslfBWHwxBRsua
	4J8INkUqHx/vCSp6ZPpdVrQb8LmLZLtZ2Lx6Sxzj8y+F3eTufZUNhhS+XTfDFMPOXpWXukboKrU
	XEFfkmyuHvKyRgBRdHboEOJqzRcUuyeb3isstDsaP2DLeumErbzhWQipefMkJIZ006p4
X-Received: by 2002:a05:7301:d183:b0:386:a728:6c11 with SMTP id 5a478bee46e88-386a72872d3mr8372043eec.17.1795514057856;
        Tue, 24 Nov 2026 01:54:17 -0800 (PST)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386992b404bsm32041395eec.1.2026.11.24.01.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 01:54:17 -0800 (PST)
From: Cong Nguyen <congnt264@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Fenglin Wu <quic_fenglinw@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] leds: flash: qcom-flash: release v4l2 flash devices on torch clamp failure
Date: Tue, 24 Nov 2026 16:54:08 +0700
Message-Id: <20261124095408.3842986-2-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261124095408.3842986-1-congnt264@gmail.com>
References: <20261124095408.3842986-1-congnt264@gmail.com>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

qcom_flash_led_probe() registers the LEDs and their v4l2 flash
sub-devices in a loop, and then returns the result of the final
regmap_field_write() of the torch clamp field. Every other failure after
the first v4l2_flash_init() jumps to the release label, which calls
v4l2_flash_release().

If this last write fails, probe fails without releasing the v4l2 flash
sub-devices. They are not device managed, so they stay registered after the
LED class devices that they use are freed.

Jump to the release label on failure of that write as well.

This issue was found by auditing the driver with an LLM coding assistant.

Fixes: 5974e8f6c3e4 ("leds: flash: leds-qcom-flash: Update torch current clamp setting")
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/leds/flash/leds-qcom-flash.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/flash/leds-qcom-flash.c b/drivers/leds/flash/leds-qcom-flash.c
index 1003ba060b42..b335784fe68c 100644
--- a/drivers/leds/flash/leds-qcom-flash.c
+++ b/drivers/leds/flash/leds-qcom-flash.c
@@ -951,7 +951,11 @@ static int qcom_flash_led_probe(struct platform_device *pdev)
 		flash_data->leds_count++;
 	}
 
-	return regmap_field_write(flash_data->r_fields[REG_TORCH_CLAMP], flash_data->torch_clamp);
+	rc = regmap_field_write(flash_data->r_fields[REG_TORCH_CLAMP], flash_data->torch_clamp);
+	if (rc < 0)
+		goto release;
+
+	return 0;
 release:
 	while (flash_data->leds_count)
 		v4l2_flash_release(flash_data->v4l2_flash[--flash_data->leds_count]);
-- 
2.25.1

