Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF053B71DC
	for <linux-leds@vger.kernel.org>; Fri, 31 Jul 2026 11:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785497819; cv=none; b=d0VuaxdbPtqL7MmO4FvsiAnlT1Mqy1WAguS/Fh7ke5N8pxS/Up4ZPIBr2prBzwZrBlC4sS1cbuVs1buzAhfNoOPCRMi7KD2KRdJBFJTZeSTW1lQb11wMR0+5/6/eMeiuRirIW6xd9FAXCnYEC9DBb57KmvqVe0p6cr+Im38cB8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785497819; c=relaxed/simple;
	bh=g/XAR49fFVzuq467Ik799+2FdWOn/LGc0r4Y6IP8+yA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HBw8FY79rw0p3fPvdyUHq4reEDODMr9LXFnn5NbOvYU8wCkY25mBYbMgB77/f1EkjxTAIfkSkMfr5Wd/ZOWjX+SggMAHXbhHn9WHykUseOzaTX1vCNxF5bTf8iMKGGUvepJvTL9Hn3Ywz5ZYF6GR80VjJ4CX6Ge1FTk330DkZ/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JKpOp00x; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JKpOp00x"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47f703a9d05so553434f8f.0
        for <linux-leds@vger.kernel.org>; Fri, 31 Jul 2026 04:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785497816; x=1786102616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WwovEeXaCAdfULQBEy/htRRSiSsUVEDD/fWA6pMEZ8M=;
        b=JKpOp00xbHR7rgB47Jl7J41iv5z2u2EC8zhFUCf8B+w9o1MW9puL5S/tT9EXAf6So1
         e6Rr3dwT0r/PFnYbUUsnIIm/48oqLM1K3MU2aoqU89ilDZuMGpLOVE6l0dJzHnxZnxU7
         GNvNbqFOzhFmH5HCRZhBU+MOd3qEMNogXeJKwHbVlV5ntE4PQRX2RFRYqQkr8rnsD+Qd
         VogE+ByHBBTTNIZaHzUabxnwFeTt6tQYCiDKHoyc7hz3LpfipXVCr6ArMdka5BfDcHfE
         sHeiIbYAnbA3mUJ4bH1qA9RS2awOtMI+wGl1jD4ziHvjlBFmXz52VIJ4oZPDlOg3a9Fa
         Wfog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785497816; x=1786102616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WwovEeXaCAdfULQBEy/htRRSiSsUVEDD/fWA6pMEZ8M=;
        b=AbNNDSKS1rsvXNuitS8n4jx2Y864i61Dhngls2MsY9e+Wy1/jFl/9xQQPL27XPxq71
         bcTM/4iwjALEsfKGlb+uOC27zMK7rQJoYPiFYys/ZCSBuWWyQ/rAEy1wJJzYECPIcezZ
         cTrFYQ0T+QceVGGf5FBT33HXegpJG1tlhMAbNUBxs55jnRX8Mm/gmjPO50EJ6qbK+rbv
         ur4KQuSLutIghesddhQ0cKTCje8pjChbIFOWhBBa2zkuOcJL7hzX1X9YOvp5g4qrIl7G
         NAseh3zlNDLq9V5dju+UACWBkx76sP6J1wfS5Hfo4eP6dDs4hG0teinLMDRErIM6wREs
         eJpQ==
X-Forwarded-Encrypted: i=1; AHgh+RotgEmDexJ+AfKYcs7BAlnTJ6AXSrNCgtHWiNYNz5Eco1NNw0vnxBt0cifL49jHwzhVInBhzPucRS38@vger.kernel.org
X-Gm-Message-State: AOJu0YxSpXAq6FQGLYkcuEHJ8Rir2+zLeTW9IKjvFxQdjbfL2oA2K3S6
	xr/Q+VCcyOoePvgUqY62qD4fcFQPkWIUSWJbDXEjRibqgG8NIK3pHmI3
X-Gm-Gg: AR+sD11sXqXWBU+ZNUxxTbscMGxHPmOqN51LWd8w3eh+Tz7vw1hHkg43uOfQYzkrUa5
	ZKxRZR1sCiSM3y72mxd1XisZphL7yoL312NXArtJ9gwxb4x7t3VzaDvFQ3K07n/wZ6ZsA3+qzXw
	1JY0wNegreD0YLLpcVeYGQvywcDB3d3gIaFslF2H8uOLqsyr9jazUCPsFZPvs4hERiHowXttgul
	XdcgPX3n+V+wdjuOySZvFq3C4wTvSQPtxO6fCTvcmT5YMnR2JFM+fi6+HRse6Whagnn9A8+iTH+
	Q+FCQVZ0AJcWebD2VOOrds+wcRO4OklSiVfwRKJIWKr69viRYTsQ0PfUk4St10XdgymSJDE509P
	z2nl4UBLFmb6M2ESlXPu9m0x1t3LdtIhFWerKgnQKEXylwcO3dKj+7hHjs2w3mf2MPkeLfvZvrE
	PnNQAqH0fjwo8sFu5g4UYyqcv+EoO8gBSerHykHb8W6zsSZ2wGEuTpA4C+7bUCWxlabcY+O8Awr
	XSlIRqhEA==
X-Received: by 2002:a05:6000:41c9:b0:47f:86af:8fdd with SMTP id ffacd0b85a97d-47fd2abad19mr3920947f8f.3.1785497815591;
        Fri, 31 Jul 2026 04:36:55 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a0c8bsm3670646f8f.34.2026.07.31.04.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 04:36:53 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Johan Hovold <johan@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v6 03/14] mfd: lm3533: Remove extern from shared functions in the header
Date: Fri, 31 Jul 2026 14:36:21 +0300
Message-ID: <20260731113632.158440-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260731113632.158440-1-clamor95@gmail.com>
References: <20260731113632.158440-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using 'extern' is not required, drop them.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 include/linux/mfd/lm3533.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/linux/mfd/lm3533.h b/include/linux/mfd/lm3533.h
index 3463b164d0c17..c4c38876c09bb 100644
--- a/include/linux/mfd/lm3533.h
+++ b/include/linux/mfd/lm3533.h
@@ -82,13 +82,13 @@ struct lm3533_platform_data {
 	int num_leds;
 };
 
-extern int lm3533_ctrlbank_enable(struct lm3533_ctrlbank *cb);
-extern int lm3533_ctrlbank_disable(struct lm3533_ctrlbank *cb);
-
-extern int lm3533_ctrlbank_set_brightness(struct lm3533_ctrlbank *cb, u32 val);
-extern int lm3533_ctrlbank_get_brightness(struct lm3533_ctrlbank *cb, u32 *val);
-extern int lm3533_ctrlbank_set_max_current(struct lm3533_ctrlbank *cb, u32 imax);
-extern int lm3533_ctrlbank_set_pwm(struct lm3533_ctrlbank *cb, u32 val);
-extern int lm3533_ctrlbank_get_pwm(struct lm3533_ctrlbank *cb, u32 *val);
+int lm3533_ctrlbank_enable(struct lm3533_ctrlbank *cb);
+int lm3533_ctrlbank_disable(struct lm3533_ctrlbank *cb);
+
+int lm3533_ctrlbank_set_brightness(struct lm3533_ctrlbank *cb, u32 val);
+int lm3533_ctrlbank_get_brightness(struct lm3533_ctrlbank *cb, u32 *val);
+int lm3533_ctrlbank_set_max_current(struct lm3533_ctrlbank *cb, u32 imax);
+int lm3533_ctrlbank_set_pwm(struct lm3533_ctrlbank *cb, u32 val);
+int lm3533_ctrlbank_get_pwm(struct lm3533_ctrlbank *cb, u32 *val);
 
 #endif	/* __LINUX_MFD_LM3533_H */
-- 
2.53.0

