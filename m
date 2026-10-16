Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DF852CCE7
	for <linux-leds@vger.kernel.org>; Fri, 16 Oct 2026 16:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792168164; cv=none; b=D+QeCIvhJOmfmdm1abVFV3Tb8FytEk3yi3XtAkZlWR8u/yaeDaPtaBjBXWYHxKflK0xeRxwa8JIhSlupJMeE9ffCVMc2QoUT4sqzlGI3ynqp9swIWszRTm52CbCUlHnyOC39MP8ukwnkDSbGHaLvlx2XzqVR5/N0h0C8WvYZync=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792168164; c=relaxed/simple;
	bh=VhR0j1HKTwNSIioD4L3f7wFrhTcLCMcVT3/oUEbt/RQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SwIc9Cw0ugXpBqld8jRTJf8cs3TZVKUg8yvM2ZuYUhIGLhZjWhlbVPzzfFgYNQI2W11AuKAZPn7VFd12H0q/NxaNJfs8+aE777y6FuqifpcHT0fmtzcKM8RPhpg929qtUo8iBwRovGuS5hDG6tcKAAf0pPl+9CbJsSM3x2dXkTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p5eqtnxs; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p5eqtnxs"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48de72fc832so19942f8f.1
        for <linux-leds@vger.kernel.org>; Fri, 16 Oct 2026 09:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792168158; x=1792772958; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JOC0Tt4izqijGr6CwbYBXFuZxdub0c8E+AAfI2tlm98=;
        b=p5eqtnxsy2WWJjYnI5bNe8HKhdjapL/R314I6/DhwaAxxcff1cLEVu/zoGeV+RzA2a
         VXkek1gTB80X66WaVdQjL7FBc0Q/QgNHhOyXtDV1pSNFmwmJmD/JtBOrzEYQncNSwpgw
         BEms1VQH2qeW5kvARan9y1+YdEdkDxOeWTP8FyJ15Vh9zq+6qOLrgl0cSG+abUnkl/Xs
         Z15dSnMSryDYpCtn0YHPWacLeBodfE+7tSVr/4a/3MXcbF8qr8ozTJDGnkGri0iMdntj
         o5gMCklR+WuPjWmTw5+TOKlLKjDbqw9q61DQGhb1j9t/YynZFw76+p/U7qUAkJFQV4nH
         e0Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792168158; x=1792772958;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JOC0Tt4izqijGr6CwbYBXFuZxdub0c8E+AAfI2tlm98=;
        b=uUIN+V7qWbNP2UuuFEWBJLJfbSC8Fp/Nsf9YxzrYJoyW3Zmnv3DJcz036RdRqL7d0O
         X5Ao1soybtWEWigM0ljCwckyM7IaLGcx6+Zv1AbFnUCGSvnhLjL+nj6pfMeKOjArzVQ4
         umUfsdkcHG7RrbJ+DAah80a6LSLGdrruS1xIQRJ4x+lKBPT9N+8eHa80UiJsrABBuGGE
         Y5rJRBpTmyc4pp/iYmtg4JuUyT4G/dpvYCYk1M+rKTHB5BSmG2k0XTSUezKFM6o0s5sL
         pr0+V8PqMd0hC4D3gHpxl/DIfQrbf7ojvU3hLqqf0gO1wl30vmXzsbD5Sy8J6ltps2X3
         US4g==
X-Forwarded-Encrypted: i=1; AKwUvBye59aIsQzSK/iRBIBi5lrmXP0iS0Usf3gdB2pHR5CTOrShO4USL/oAyt5VVS6sV1sAjEvvSYaamGol@vger.kernel.org
X-Gm-Message-State: AFq9FYKUeDiGvmhNKuDQ8jyDAeUu4AQQyd3Tj5ArbUqhMzO4ekU+Aufo
	shRZQazvHKg2h7Flry4NTL/PmAv2ob5tNz6BNv8VHAmDMcOP6jRO/gho
X-Gm-Gg: AYBFou0UP2PRC5VpU+chu8bx5BozgcBWd93DHgZAuT897ZSwq8ASQwTUp3CWZpQqwVR
	c/uHmo0tax/15jfnjYKfCysGcDsOzGr/gFZ3eRQyB+YkWEHVAfgcC6Qtxl+2LRHd9tjx9xjobKB
	vpqAMzXZXaNkDSRELn7chpzBu0vsxIDZdd/SHdOEZ873RKq5YBFcKe2c9rkKHWlnitC1J250HNQ
	4PoX+IXkBOO4ODeaYdi1jAYcY077/KyGnX9MP7Ag+wCDvD4TeRw09Oeee5KjgQIayw1YIbcFqf9
	hDLjuDoX+gUiqYmm1mnj4OvdNMTPjJ/+nRoeqb0BcXjIgXumsb8ykWLLwy9FclUC4IjUErfuPvQ
	j+UcHDSgEpz2/Lz7wLHacaQnf+86bEtytwYQposHoBcHM6is8psaaotJwBvoeE6HnTowoihzbSo
	bBqIEZKD9HchkH1+Dqsc0Yo0uWfY+sSSomykAjXwcbgSQ4l7UqiGKtHtfOqJZyyQM/ytuNtrwTV
	Yuudq9id8AJolTT8OgxhqQa1/d/agGWCaw5A8Q0vkWvwT95LF3osfvjNOw3IpwL+iQ+lMrulj+k
	g2OYPvpm5wUB
X-Received: by 2002:a05:6000:260f:b0:48d:ee35:b3fe with SMTP id ffacd0b85a97d-48e07988925mr282504f8f.8.1792168157866;
        Fri, 16 Oct 2026 09:29:17 -0700 (PDT)
Received: from machine.home.arpa ([2a0d:3344:57f6::103c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c5942sm9404317f8f.16.2026.10.16.09.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 09:29:17 -0700 (PDT)
From: Luka Panio <lukapanio@gmail.com>
To: lee@kernel.org,
	danielt@kernel.org,
	jingoohan1@gmail.com,
	pavel@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	deller@gmx.de
Cc: dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Luka Panio <lukapanio@gmail.com>
Subject: [PATCH 0/2] backlight: Add Awinic AW99703 driver
Date: Fri, 16 Oct 2026 18:29:10 +0200
Message-ID: <20261016162912.64581-1-lukapanio@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Awinic AW99703 is a high-efficiency 3-channel WLED driver with an
integrated boost converter and 11-bit brightness control over I2C,
optionally combined with a PWM input. It is used as an LCD backlight
driver in some mobile devices.

This series adds the devicetree binding and a driver for it.

Tested on the Nexphone by Nex Computers.

A board DTS using it will follow separately.

Luka Panio (2):
  dt-bindings: leds: backlight: Add Awinic AW99703 backlight
  backlight: Add Awinic AW99703 backlight driver

 .../leds/backlight/awinic,aw99703.yaml        | 131 ++++
 MAINTAINERS                                   |   6 +
 drivers/video/backlight/Kconfig               |  11 +
 drivers/video/backlight/Makefile              |   1 +
 drivers/video/backlight/aw99703.c             | 583 ++++++++++++++++++
 5 files changed, 732 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/awinic,aw99703.yaml
 create mode 100644 drivers/video/backlight/aw99703.c


base-commit: d419d682257d813f6cb7a28e42b35d0edf4ad038
-- 
2.55.0

