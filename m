Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD51551DAED
	for <linux-leds@vger.kernel.org>; Tue, 13 Oct 2026 18:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791915508; cv=none; b=exE/DP7Hc5PEoMcIF5dIuLLrva2phkaBiB/WGPfTM+hoslBqikoKiJd0S2c9ioI97myue6SUiq3FGIJFp1R60bpcP3ZKjtz5zMt0ImuhfTiyYK77pWQobI6W/8P0jmRKTTpc+O+tJdBTbCUkr7o/+NIJebGeiAZMUp2y0SW4wbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791915508; c=relaxed/simple;
	bh=lU65QQOg/GcibNh5g7Zm+usPEygQ/b2DT9OWNFxlqSk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rO4EE0/N+qJlMW4YMor+KtG7ZrjPlgHNsYorMYSQ6x8nmnz6J1F8mmkcJI+ED73rl0dp5mpAnlaQyPUw1/PheLvkQHMwMpOvmRYLxXKyd1TURmSijCvv8E6eGz0mxAe+om8W/62MpaxwaxyQdOqgXJE/1FBiaQNYgX731Ndjn/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SCECqCcM; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SCECqCcM"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48b0584ad71so1906006f8f.0
        for <linux-leds@vger.kernel.org>; Tue, 13 Oct 2026 11:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791915499; x=1792520299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Bk4II3Yi7edkXaVIjuxBcIHECnvxgrsvWyjVkvqUUw=;
        b=SCECqCcMswpP1Jqe/3SKc4yBh8DNfsTlhoUk6WxJNygxwBO6vCwn4v3T0A08M5/HR6
         3u2JLAllLO+YhIUFR6/0ZMqITR7j4FajTS3EJDxUSMt7J4T8HfJPW0w39OyY25VvsEUa
         FFmZb44fcIuNgN1hJFvLc8Gw+93W1Qgb0gM10vGkEH45ReAdfyhOTPaTEBE5cyirikMh
         KwlBOKYwhP6XlDtaJdX066xnvYytbAJaTYRZz9mYE11H1YztPyYFftrKmSU8t9q43daJ
         jrrBuEECvy3umyrGGAG2VMR+pIagIbsNoFn3p89Lp1vTbHobKP6DVV5/bOsk3qFlv+11
         E8lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791915499; x=1792520299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1Bk4II3Yi7edkXaVIjuxBcIHECnvxgrsvWyjVkvqUUw=;
        b=GoOPsVM1AG4l3geBbMbuYZGwmtOmEwnC1G+Ln/EBUYTfNJaN2/lIpW7nGOEwpQORI+
         6OEC9nPlCOBZxIQ67bRiq18vwLVwMhbs8NbpchZyVfyU8mn2HIEsg+xWVnWIe+rWO322
         Dh+m6YmVzY2d3q86FlbDg7ta1JvA00piPUoo/8bHckWvyObp3z3SlPvNuo8g2wBqkCj+
         lvcUr3H7F836sJsRabtoQAYoQ/EWr+MfcZFVsWSd9PSA5k2GqyYLxhYpmkHvQsF1QXXK
         iP4YTwllINJX2tY93lBBRPagSYuekmncSlec54U7zoOm2UmiOeXFcjclFvljrnAchy3b
         s30g==
X-Gm-Message-State: AFq9FYJFumaRxgcKIvEG0PoeRpVvv3UCg68+unIIeKnXCqR69QDLdLnk
	K2uX5dXuliy09Tj4DloGNvsA+Ci1WYrONpBSvud2HYZKz65tPQmhdHRz
X-Gm-Gg: AYBFou2AQrQvi2M4pfHUmjFD93dg/VR2nPkpauBzwLcfgJEvfXcX/NO8U0A8gJJYryu
	80eW6Vyh/D3dzUvgecLuR14SQdYDssVK2lHcZbFi3GOo5AHbcnEUUVdOKpP8WKjV/Fj7lzVcmCc
	qDZjY9kH2tVPiyHoSCrTi9xfg4NZW/vh/cxQcAs8+8Xvwo8jYzymRAF23eYvg5vApo6SDOV8OPI
	/aLmxwMn9WgOFs22YoaS0M/D++cT7TP0VVB/1p1Y4EQttZ8Vw8+eYs/mnqnkxaGreU/MGL6LMNh
	KUDk0snegPWkYvMOE5xPA+16uQi7QerQDLxKlWugZuevU8LlIsx6cJLGssB103bSrjEqcREk2tT
	j98qwl/IqUrikSJqrRxGHrZK3wd64owd3QDNOn5BeI5eyowTqKYGjdeySwkMLjHxuLHriZJ3LDA
	kQSLcNrEjX3LjQ273NVU6M9QxrO0mFBBzNWyqMeWaHl2yMvz3ozcif2SPPS23OJ9ERz4pUNcrHi
	FyDYwNIRLvZWe+1owU=
X-Received: by 2002:a05:600c:630f:b0:4a1:9f59:ee7 with SMTP id 5b1f17b1804b1-4a19f5911f4mr137303645e9.0.1791915498902;
        Tue, 13 Oct 2026 11:18:18 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac36f9sm6379903f8f.36.2026.10.13.11.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 11:18:18 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kees Cook <kees+treewide@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] dt-bindings: leds: skyworks,aat1290: Document FLINH pin
Date: Tue, 13 Oct 2026 21:18:02 +0300
Message-ID: <20261013181803.496627-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013181803.496627-1-clamor95@gmail.com>
References: <20261013181803.496627-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both the AAT1270 and AAT1290 feature a FLINH pin used for mandatory Flash
inhibition.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml b/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
index 7c26bb135c0a7..a5f3eba7d6480 100644
--- a/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
+++ b/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
@@ -31,6 +31,10 @@ properties:
     maxItems: 1
     description: FL_EN pin
 
+  flinh-gpios:
+    maxItems: 1
+    description: FLINH pin
+
   led:
     $ref: common.yaml#
     unevaluatedProperties: false
-- 
2.53.0

