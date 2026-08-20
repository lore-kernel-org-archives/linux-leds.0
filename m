Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ECDD46D57D
	for <linux-leds@vger.kernel.org>; Thu, 20 Aug 2026 17:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787247664; cv=none; b=Z2ZoVyHmoNSv3sXZL0kOvqeRLyBBqVCTZRi3Nqj4jVrkuwtiBsBWeIiL92Rr4VaxLEsHB5y0zkpCOn3JvWRk6SaoghFOvc3SqjcxqColVbr7ao3xiPM/BS84tLFVULLjYS6lMQEj5MyMPo/BBO5Ukcfa2tXua9fzYfIrXI4/PGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787247664; c=relaxed/simple;
	bh=gLnmQZA+aRbh0ERqhM7KIhIwzIoNAiCX0fKU0fCuWxY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B3eYbMo5Q/h5WzTyHLBpwxAl41JLVehKUdAzkoSGBVpg3/5SUWAQBGn6HgeRNTflahMfuf2Kb51lBXe9mQnyMnhi1gcIjpnaO0NinQ3UpNKswKbfDzoEtpXmlaoLTWd3usDhThlsrj/28Ju0Ne+OtnOYMo80bMDDvr7wNa2v9gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SwD3nd+R; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SwD3nd+R"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3900e39d935so64850a91.0
        for <linux-leds@vger.kernel.org>; Thu, 20 Aug 2026 10:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787247661; x=1787852461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XLwSGdGA3DzI4yH7FfjOEmQTOKN+rrAz8ssaqu6ui70=;
        b=SwD3nd+RXWi9Fpvs2fKeghkxRFYHj8+qtFPWhxtdx9XuPpODUf3d3rhKYy0nM4OrYg
         7uB1GqddYNFZp8k8k9nYKWdg6HBF49HTd+MbpP+gVzM8duEuqGFqfuw7qECVv9fv79hf
         ine7YT1GLoUf8DFdQ1Z2NkWEAhn2TrtpAsnA2Wv/8tuGvvB9Fc4oWgplIpyzByzB107U
         YeFA3h/dPM8WQ92OApuFcACwEYAC9l435N6qujXfLu6u2L6nxvXhx302HBclPrGTSERq
         KWVURZ406yqRg3aMFzQmnC9ivqH6NewaAyk4apgPlmv6AUt1I92kqcLf/FGJEQPnpb1R
         ZOUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787247661; x=1787852461;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XLwSGdGA3DzI4yH7FfjOEmQTOKN+rrAz8ssaqu6ui70=;
        b=VtmpvlBdPrAeWlJvVJSEgxxjbnihdYujrvsCGQg1CVtHtCVI1hayDio7RALAy2+n3i
         deRZZ3mr8LNKivp8fVYEELFZ3va0CSbdIdgfXqgQWQV5yZdIhXNATb219+ytybGm/iv2
         5K101RLqSa3IHlugbNl6tBN+7dfe2Js09Jv6YZ9hye9vVupCZH/qHPAu8/iNK0UrTRmp
         V6YULocNuxMvU4oUQEMh2/zrqLvfBhZHUVnaKhw+z4tLibjxKvD7p59IFNZknw76Tn4Z
         Gk1GzRDALaxPobEVXDJBhwsBA2X5IXU61KQSV3MyLyPecIwOQV4Q2toA4IEPJ6lkX1lE
         lfkw==
X-Forwarded-Encrypted: i=1; AHgh+RrPHe7aHaVoz145S7BM6wwgoK7KHmhAOZLPm5ncdaOFYv+G/jIxe3jle7kTw0Pwr8oUlzIEKH9iC/5j@vger.kernel.org
X-Gm-Message-State: AFuF++k8GalkfluC6hANGfZhuaFMjlBEa7v6Kb9FSIn7VHRVcWGmMLKm
	aSgTpP/P79BgW4tZVTkYvHzTVMdCLZrjongEG/BpeL0DbRRzvTUj7+LLZ8dB8Cni
X-Gm-Gg: AR+sD12Fxzldt+QByKyh0EsLJbX6dSi1JDTk97FGbjIkUwacw7VgUCjU05xoFen0JNV
	rbSNn9FksjHOpt16PrunpmY7q7KVfA6KVluwfqnjoCW0wz7/s3Y7GTHu3mQyFQEuOZqbIv5Lfkh
	vnquKsXB10ecmtT7LK20e5K6yLuQ3cKBYUqheXdiubICVzHR6RTAUITaabgH+tHcMIYQum0Jf3c
	FTH6/1KFkTvCH822dgjyxhCwQysi4hjgYUER+/Pn7xbDnGDvmQIdANET0lSyPNa6cYruylj4x8u
	JWeO02V9Fs9i1gEMOwdodGGYm68tN8tj2wsuu3lCXv8yUTJd2c7l+/iOXLuc2iEmGYiU748+dR/
	K81r7Go9alS0LcT49l0yfoGuL6RaM3a1r29zIQm5igmwVydvniARjebiv1g1RZpr8S+UjMRBQpb
	W6s39VBP0V4oED+S+Xnyb1ZhQDyPG3+fAK0dcBrbe6OyZWiH6JSVkowN7tUsZaussaloSMT8BwP
	lqLnUMD3QWejwhRvWX5iMH6Di1cfgvkmYTad4RbHBxvd6m1f/JgIxk4CTJRwDY=
X-Received: by 2002:a17:90b:33c9:b0:37f:bfa2:1887 with SMTP id 98e67ed59e1d1-395c3552d6cmr267463a91.8.1787247661327;
        Thu, 20 Aug 2026 10:41:01 -0700 (PDT)
Received: from Mac.net ([12.162.234.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416aea2429sm17340401c88.15.2026.08.20.10.40.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 20 Aug 2026 10:41:00 -0700 (PDT)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nam Tran <trannamatk@gmail.com>,
	Kees Cook <kees@kernel.org>,
	gustavoars@kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/2] leds: Add IS32FL3207 controller support
Date: Thu, 20 Aug 2026 10:40:55 -0700
Message-ID: <cover.1787247467.git.ahmadexp@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a binding and LED-class driver for the Lumissil IS32FL3207
18-channel constant-current LED controller. The driver supports individual
and multicolor LEDs, per-output current limits, an optional supply, and an
optional SDB GPIO.

This is the LED prerequisite split out of the Time Card v5 series following
the netdev maintainer's guidance. The dependent ptp_ocp board profiles will
be resent to net-next after the LED and I2C prerequisites land.

Changes since v5:
  - Send the binding and driver as a standalone LED series.
  - Raise the minimum led-max-microamp value to 149 uA, the lowest nonzero
    setting representable at the maximum permitted full-scale current.
  - Rebase onto the LED for-leds-next branch.

Krzysztof's Reviewed-by from v3 is not carried because the binding changed
materially after that review. It now supports groups beginning at outputs
16 and 17, documents the RISET/current-limit relationship, and enforces the
controller's minimum representable current.

Validation:
  - dt-doc-validate
  - dt-check-style --mode=strict
  - targeted dt_binding_check
  - x86-64 and arm64 defconfig/allmodconfig W=1 object builds

v5: https://lore.kernel.org/r/cover.1786746757.git.ahmadexp@gmail.com/

Ahmad Byagowi (2):
  dt-bindings: leds: Add IS32FL3207 controller
  leds: is32fl3207: Add controller driver

 .../bindings/leds/issi,is32fl3207.yaml        | 285 +++++++
 MAINTAINERS                                   |   7 +
 drivers/leds/rgb/Kconfig                      |  11 +
 drivers/leds/rgb/Makefile                     |   1 +
 drivers/leds/rgb/leds-is32fl3207.c            | 736 ++++++++++++++++++
 5 files changed, 1040 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/issi,is32fl3207.yaml
 create mode 100644 drivers/leds/rgb/leds-is32fl3207.c


base-commit: f8cca63a0a4f3475199d9ab7f86782bdfeb0744d
-- 
2.50.1 (Apple Git-155)
