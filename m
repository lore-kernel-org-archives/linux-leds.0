Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733534;
	b=brSrFWeEeu8UN6DN0+LNLXYKO5CBPv20TfkNJzjNvGGT+ddkxs1ruF/FkUJ/gW5PuHJd
	 LpIrOlhcmNmJ7gLb1OshuJHoI0LiQZfzFX3cfScHi+GXUVSqFPY2WZ14BZe57/TGc9Pf/
	 g7av/TxxzOFXbZ8L5PiowfCrNnlvlBSMczhrvApxJW+Hjes2Z0SqqGgbJ0MHKl58B/XPs
	 cfLevuSiw3DGhWNwJmyPJ1gZMGjRUJYslatR7MOSncqnxt187A2YpWTMLjc1w+yZkcw4b
	 8XnPApWfJo1DgqpOvEPp7DzM9nbLmmWQ0+d0yF7h/dZwfx6NBeZRXMpwl/MphYRYcCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733534;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tjOAhQdC0cg0LV1AxBgSqlMHlzoOkm0INHdUNMNhIOY=;
	b=u6KHW4glug9Om6JRm2W9uDgPxKMUBYTH6ZT7Cft9cmUf2qOCCrZcB6Abum3wp1doBcRw
	 S/PySUoVyGiCpA9iSFmTm96o+kq7Sj5UKve5wnYNXq+3fjCJjejYp6cZ7K1nNmNPkt57Q
	 vKrqz6x3RnRiqlbwH6OTfA3XqiUeoQjzTA7OirWVFDJ+GrgZQUGzGONueEIYjeuxKkLKR
	 NNpf5w5QlBwHVOhPXmRm17ViEP6peSG6iGonVT1dA+ed6omoVWXvuquVe0mBy2RZyqrqr
	 4GiZg178gDE34dBOy3HVAozrMBe9HQ5pH6MgC9LeXkZu0g8OxL9DAzqReMA3mJQsbNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ih+nrjKF;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838E6606A338
	for <linux-leds@vger.kernel.org>; Sun, 15 Nov 2026 09:05:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 838E6606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ih+nrjKF
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c50cc7540b7so48500966b.0
        for <linux-leds@vger.kernel.org>; Sun, 15 Nov 2026 01:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733533; x=1795338333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tjOAhQdC0cg0LV1AxBgSqlMHlzoOkm0INHdUNMNhIOY=;
        b=Ih+nrjKFK5iCoO2tO7pmH4BWGl0hxpb95KHxQ4/FgWHWtbhq1z+Ym19vNfTmdEKS2x
         IR9BvFy7eMplgehfWprfu9XBH7qqi9EKHZGvlR8PO2QQrOyXcBv4109VJvztPeeBEKgE
         wSXsMVU4ej1cUhzJXB6iPP8VkoYaTBjAAlc2IEsw8/UZIMIBQbScQ+6JkcOh0jGd2UXB
         lYGtXrNFqHyI0Gr2LnDE3XgN3PqQcGuqmwoGMcWGbKjLSPicUTFruc+6kkFFICtINFuo
         Je3BDtjriYVp6eagNVfSED46cJjJbG+a2aKKvd9ZD2wFzNXeUZ9jrJHGhoB/2dJzYMfs
         2RcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733533; x=1795338333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tjOAhQdC0cg0LV1AxBgSqlMHlzoOkm0INHdUNMNhIOY=;
        b=uN0isHOpMEtZrTWOZn3YQm9mfA0C47OB8cbMSE5MEc+/mHbEQTtx7sxjigQlUC36su
         sOtc/m1/jKAL5YlhN83QJTpwcAZAblhZz9KrFnDTMn93qloFSWVuuPx51Atg3KtgaTVS
         DNJxcNGFg+cvLwNVA1ISHPO94asCaOs9UHxUpN106v1CBcA6148NjHNkxAYehH/W+smu
         v/ye12iC3qExukxFaUhCRJ0p+HXFmhoZ60JPjBK1y/IedkrBv48i3DTRtk15/tq5riap
         9R8QjREhT3QS4CxiR+UlfNB73fCuREPdbUAqeRU8knaBcTRi7hMhABiwOJN9GZs52xC2
         rx8A==
X-Forwarded-Encrypted: i=1; AL+hErFAWct6HqfvSFERwCwVSe4xqVkbhnF4C+lWBiT6oRNJjusN9FFRdqDv56arzvZL7icY4vimajtCwXZ3@vger.kernel.org
X-Gm-Message-State: APuU4Z+08DUkEEdkqfGPS+V+VKkRkXuNixUgeLsRZ18B/sTzNmg9gMjK
	fTy7Hh0B2qLu85ZX0gGrao/BT+5BeJM2CBlbY0+gPRRPM22tF7tkKrE9
X-Gm-Gg: AYBFou0Dfu5Z02anYdJAQybM2UtnI3e3xDuDAn70Dr9Isv4ihCIAW0gCiqdgY9apAnF
	eJY61B8lMdyABoETQczYPfIBRIEaNxt20Ar9kd+vwjTDtwiB1NNazZDWp1RarZAcPN0Hf8idFyq
	4ghxzc/dCQJolxDk50n+TO4mofCTm7WAgjZhyIWdsRerIfLS8DxuuJpuleTqGboCI9w28+3WqUr
	YuE5hnECwrS7s5ief3J7Vyej2Y3+nlOza4nVz9TxykODhbyVxWoAvvg1emz8yK9d1Mmg9ZicMZT
	MjOios9Ot1pSsHVuQIAP5EhX15rJ0vCAkDOotpzxq1IlybMlJNVDIDYa+6WFG83Sz1V/iVavLza
	3RQP/pOjm/LsQK63XsLT7UyuiUfc16FXrqHl/q1gjrTsOND6pHOUIOuf/8/bLAcCl2OhdOWigqQ
	7BXHT6Za6ZtVS8X/YT624smNZ+IXHX4iXeRM88AY/awo2InthPcgP0qwW7aiQHE7MY0t6yzd8w4
	M5bYEHBQvUUFQvbjng++HN/8UtoUTIiVLTVg2sZ4yroiECs9FT0EBqAaI7LEE0g1bmA5JC24YGg
	pD/5cPl2j8EJFCXRSbOtOxqAGRaIOoqfLecw3QDG9VcPOk/iqWeOzhHBxgrFMoTxYCrHu+IqaTu
	f1db+v6RU3bC6Hyieue2HnaHSKiN+JkQ=
X-Received: by 2002:a17:907:7296:b0:c40:aa04:18d5 with SMTP id a640c23a62f3a-c50963075ebmr684777566b.15.1794733532776;
        Sun, 15 Nov 2026 01:05:32 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5c4b7sm288103466b.1.2026.11.15.01.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:05:31 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v6 1/3] regulator: dt-bindings: maxim,max8907: Document LED support
Date: Sun, 15 Nov 2026 11:05:18 +0200
Message-ID: <20261115090520.102216-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115090520.102216-1-clamor95@gmail.com>
References: <20261115090520.102216-1-clamor95@gmail.com>
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

The Maxim MAX8907 PMIC supports a single LED; document it.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/regulator/maxim,max8907.yaml          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml b/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml
index 6cf8e93867e1a..ee1a305d1c210 100644
--- a/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml
+++ b/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml
@@ -31,6 +31,10 @@ properties:
     description:
       The input supply for MBATT, BBAT, SDBY, VRTC.
 
+  led:
+    $ref: /schemas/leds/common.yaml#
+    unevaluatedProperties: false
+
   regulators:
     type: object
     additionalProperties: false
-- 
2.53.0

