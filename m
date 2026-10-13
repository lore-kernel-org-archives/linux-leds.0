Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0117E525A8B
	for <linux-leds@vger.kernel.org>; Tue, 13 Oct 2026 18:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791915503; cv=none; b=TFFNH4pws3Q+ZjHbArLIxi2vfRxBk2UDALO6sTk2A0IHi/Qk1hPHy2vz/h3bQt/cXa/6gyD5aPX0sAai4WLM9Q5TZD0NDCTD5BvEZC6owpjt1358RaL8SdqfzRRu1LFwlOIulBztxlbykJGQuKOgWOjYwaWQP/+KafCY3J85fkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791915503; c=relaxed/simple;
	bh=nxoM6aqmzwRV8bE4p6kF3mZpEO4PV/m/0sBGUc2ECkA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dbOSv3iRFJDpzarxd9T1UGLodTNgmS2ckbBbLizQzr4pKOgcV/M8r+XmmVFGIN7w9hEea56arsMWsnksDG/64rxqvKI9sT94OMlmtDbht89PUnhrDRztG8953IIy7xC0FNwCtnGSmSDiyZ+8PwjHoidnBVxwYeB/ZY/lgSd9H7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y0EXaT74; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y0EXaT74"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so27487325e9.2
        for <linux-leds@vger.kernel.org>; Tue, 13 Oct 2026 11:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791915495; x=1792520295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E3hQjmEMreIOp/z0zH8ILmz0PDZuKIXrXvhSTza6jwU=;
        b=Y0EXaT74IxmPk6Gm057hWy/QFEVGQheYGSjsaVWWit6ogybM15dEsBYkRDKJuJgYkB
         ZYFRDLTfZkDWguhVVfFV6caxQVLNmWC7DrqTDkwW9+6tqF8ti/BVy1afyjjIjJuM3CRA
         dJnZxUSsVFppFFHviNheWzjNmMdZc0C24biruwEealLwGoMfsmhOEZM3wP+/jfjALKeU
         NiQhy6qGD468Dla54HW6s5WqwFqAU07WftGTzl6SL74g3ek+y9agntGB/VLWbYM4kOBZ
         B6XUzOpYNi5+JAoP+AoSNL0Pa2a5cKvpyOU/eb367ed+ELHryuQLAzE9hvtKWmndxto3
         oYQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791915495; x=1792520295;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E3hQjmEMreIOp/z0zH8ILmz0PDZuKIXrXvhSTza6jwU=;
        b=qVSEnh74ecQucJCu2oUnqJqv5bZxnJrq3INJ8yLr54nGm8Vj/vyX/XH0kQHsxcmKtY
         Vsirp35ZbRzmv28a8MZVnwV9tXiDfeAuTzOadRQTAjOv/ESbYtPGFZW5dsABVU74xZXB
         tu23fG8ybsknx0catvTPpcBo+tJQl0EDzty+mqWnkqsubOXgb2aOeajvqtXGAauwpzhp
         21fF7MDK+ix6spgSiyEmx+Iuhr6vvnIDtf4u/m0qHAMvgEaQzkxo6ESmpscGHrLKZhwi
         /SaiN9rVO9UvQA9iorAsArQOlLa4fozgkldfhPgMSi0p+miYPLE3gZMTHmJZ1eE3hvEw
         aXuw==
X-Gm-Message-State: AFq9FYJrJ/kmvZY0s64bsKhjILG2h3rTgCD4VnJi0FXg1BKqcyJh0CcH
	sGGuZpXoWZyzRxQlNrUnnVR9IPO47004llI5dlYRKnXD5451WrVwydM+
X-Gm-Gg: AYBFou1qpg8Ye4xvX7xrWCO8WVtFjtjcUghj0z0aeS1F+bJQtNxibymxvtJyMO+0PLv
	jexZTuI2rkm1hrGuMAif9hU0xQOQLu3LgOidaM+pFZ9/Uh4uIvUFsRHGM3gQaRmMGqQdPZb3qM+
	xvOUH6KBOAGoVkJUTtM9m2w7UGyrKuYTIQwg34UgmXgQPHe3jQj5H6F/9EBMrRu4OpBYuxFiVls
	PfXOXhotgbg8SqK9KQSOsqi40r5o3NvGSlju6l9o1/cL7wOcYkRuKwacbBpXN0Lpy9uEpu2gv4d
	2unbjh/ljuukgCgYIbRq7p6RZoVHgMFIo59exUVezBWKMojcGwPjdnjNXAA/JPkI9WXZzFVMKQ5
	HZ+dQATcRG3TPnnUmngebJb+F0R6OcifcqWAFvDGy3WZHgI726jtvXDMLmzQu60xdlIUtCzTrpx
	OyMlqelcXLeL6CaT+VeIlrdvuwPHeJuHGvHqHLf6FhgAjlPf40JP5rYU3A9iPPmdeM7unMg/yWT
	ZswT9IR8vobYGjJ7KU=
X-Received: by 2002:a05:600c:5391:b0:49e:7a10:1b71 with SMTP id 5b1f17b1804b1-4a18e4a003cmr266822965e9.11.1791915494922;
        Tue, 13 Oct 2026 11:18:14 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac36f9sm6379903f8f.36.2026.10.13.11.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 11:18:14 -0700 (PDT)
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
Subject: [PATCH v2 0/3] leds: aat1290: Add support for AAT1270
Date: Tue, 13 Oct 2026 21:18:00 +0300
Message-ID: <20261013181803.496627-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document AAT1270 and FLINH pin, adjust driver to support AAT1270.

---
Changes in v2:
- added formulas for calculations
- adjusted mm_to_fl_ratio to be set according to chip info
- adjusted timeout configuration to be set according to chip info
---

Svyatoslav Ryhel (3):
  dt-bindings: leds: skyworks,aat1290: Document AAT1270 Current
    Regulator for Flash LEDs
  dt-bindings: leds: skyworks,aat1290: Document FLINH pin
  leds: aat1290: Add support for AAT1270 Current Regulator for Flash
    LEDs

 .../bindings/leds/skyworks,aat1290.yaml       | 13 ++-
 drivers/leds/flash/leds-aat1290.c             | 91 ++++++++++++++-----
 2 files changed, 77 insertions(+), 27 deletions(-)

-- 
2.53.0

