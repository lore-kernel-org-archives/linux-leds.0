Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FE8383987
	for <linux-leds@vger.kernel.org>; Fri,  9 Oct 2026 09:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791537073; cv=none; b=kAe2GS/Kgo3MfPgy6roQstYSggiK9iz/YB/5lQtIkEZHKfN39l7siq5lDp/HhoxzBCZ7PnQWJ922na6UN68UFxOrIEdT4OhPRWdimIU04oZJ4GKSCfTM6UeL6z8W9PMUpTP4h4C/o9v07hEFdARJiDEDG0p1hbPAUdMdqSsMkSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791537073; c=relaxed/simple;
	bh=jXxgq9abOLg2kmwgNbaljQUPQ/KD0BTdZQTllhbjBbo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PbBtJxlqNEybCTGwMtGjQAgrAp+pCYv0ZyyodzqbHdB6fU6Yfk+iJOkgSQCDKVSAU8hg+E8NctM3Xc728o1Mr6OQx9x9WguWQGi6vDWTUc4QxalJx48gcsaenG8UqVVR57XFUDjXs7bLT6+Xrf3TiXPGQWUStmSplZ6sjpLJkeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VcVNGaq9; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VcVNGaq9"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-154e9d2d979so3932751c88.1
        for <linux-leds@vger.kernel.org>; Fri, 09 Oct 2026 02:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791537071; x=1792141871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yqkm1HxfTq1FvqOE6B6FS72pIuLdd3xBnpZcNmBPGCs=;
        b=VcVNGaq9vmns6Oy+ekhYBQlT3JFZ+XBTRxW8g2AumHtBGSQD+05baClgr2pVPb2i9z
         OKJ319aOi8sERyaxmXvxFK54YUbK3yx6vj1zggWJX0VY4b3q44xFlnT4+y0/7HyR2gBa
         DHzH0ksg02ppzldt30/dOuygKtfj0noT0pHgLDOOH9+9kdY5ttPXZFuFBRnomcCRrj1F
         msu5hI/mb2rHYpv9Wtp88EnPFUSU89AbgRzQcBfBJ//gFou1ce0ZXzEOWfVHjwrS0S7E
         zKdZEIpTFUAItwxi31Cn4w8nHfDwIDh7b99u7Ix04qxj9AXpF8nsCPKhdMXaZ5kXNCDp
         AjMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791537071; x=1792141871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yqkm1HxfTq1FvqOE6B6FS72pIuLdd3xBnpZcNmBPGCs=;
        b=HHEJNtSZ+GroijGsSmJSgO3/o3j6qtSwXKCrOL1CDemyTpM6GhKa+3cQnKg5TquYFy
         AetPZKh5ozVx5IwmUm/GWbFfSNwm0c+2h/bzf4Cx5o/8Z5tpvuJ2bGW5AqcC8KxT96+l
         k7IA74oEf3FfInfR7ej4iakTFjSsqWUiVhFTk652FBlnBYotQDfqnQvHXldI3AaR8a1r
         Md+LYhemjJjL1D2L/SlW5kYZeikVN200R4TuFXMFx3trZTa0zsOOFNW82Agzt58TK+7M
         Rgv29in9UoG6yddIVqErJ7hEQnS/T7i17Lh97B7OikSK1jcnjVYD4py2SoMV20+j6DHT
         2iYg==
X-Forwarded-Encrypted: i=1; AKwUvBwBRFVFn8P7VaNkTHGBUSQtUR0OpjJxtenoo33YwextNxvNR4HS2h40KFg2tuWeqwVZC2VgPNcdDKOU@vger.kernel.org
X-Gm-Message-State: AFuF++nXdZYGpURjm5StvGaY6sn/ksykIy2TXG0tNoD/1odnBtJocfXc
	bpy5nlnGm/nsB8wJ6lDZVYK26LAXbYqKK56VMLecYKP1+6xhcqjqGrUlL3OlUw==
X-Gm-Gg: AYBFou34ZWpqhrEH8ZNFdbY5ovGiJMajiwoKvAIdhAe3gTDnRqH2Tm9M4IM98t5WgrX
	zdXLyQGqQm5RzvXaXf/3HXxu2JZeZlBnNVueAkeC7TIl256gF29JN4xrPVqgS0dLoXAie3zxt8l
	Oe32TqBx5taL7XnJf4MPWAmxEQxrBJt+srlzHVYkSE+qnU505enhb5VndWFtTu57xIDh7pRlcYh
	XNduXaVDoQIjApboaAwVP2eQi292MHj8sptfE7Xf0pMzhe1jhUemyXhG7ztapPY6FltN/YtsQBX
	Wna+tTXVy3QfWPwoO9Qj/yBak5NkK5mKDHTwYPxOnbUekI4Susjbh2twXKrey7WXIVZ2IpMtTzi
	u5l+uoqYOXECc6QAz6vkSnTFiJrvFNZjlgL/d1BBYopIKhRMMGPrUL42RVQFccE+xglvOa1GAjo
	Ehjc7/7/vaLfWvjKdDVk4W97G0/+2QZjeHHSBUBXUgA/RwXW3hJMsnKSwZ+3vCaPDhuCvwL6Y2w
	T8xi3/JHJ+IXukZ+Sa9F9w+w1heoEi/1pcusOPR7yZrc/LAjx1mFS5iAJEC1ka5CzBquombqx9o
	EuW/VI+axGAgLQ==
X-Received: by 2002:a05:7022:c84:b0:146:5f73:d45b with SMTP id a92af1059eb24-16a54fab691mr1538668c88.3.1791537071275;
        Fri, 09 Oct 2026 02:11:11 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1becefdsm5125444c88.7.2026.10.09.02.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 02:11:10 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Dan Murphy <dmurphy@ti.com>,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 1/2] leds: lm3532: Propagate enable GPIO errors
Date: Fri,  9 Oct 2026 16:10:58 +0700
Message-ID: <20261009091059.25729-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

devm_gpiod_get_optional() returns NULL when the optional GPIO is not
present, but may return -EPROBE_DEFER or other errors.

lm3532_parse_node() currently treats GPIO lookup errors as if the GPIO
were not present.

Check the return value and propagate errors from the enable GPIO lookup.

Fixes: bc1b8492c764 ("leds: lm3532: Introduce the lm3532 LED driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Capitalize the first letter of the commit message subject 

 drivers/leds/leds-lm3532.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-lm3532.c b/drivers/leds/leds-lm3532.c
index b51496910b08..a3bc9680dc4c 100644
--- a/drivers/leds/leds-lm3532.c
+++ b/drivers/leds/leds-lm3532.c
@@ -560,7 +560,8 @@ static int lm3532_parse_node(struct lm3532_data *priv)
 	priv->enable_gpio = devm_gpiod_get_optional(&priv->client->dev,
 						   "enable", GPIOD_OUT_LOW);
 	if (IS_ERR(priv->enable_gpio))
-		priv->enable_gpio = NULL;
+		return dev_err_probe(&priv->client->dev, PTR_ERR(priv->enable_gpio),
+				     "failed to get enable GPIO\n");
 
 	if (priv->enable_gpio) {
 		ret = devm_add_action(&priv->client->dev, gpio_set_low_action, priv);
-- 
2.43.0

