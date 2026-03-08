Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E04422FE11
	for <linux-leds@vger.kernel.org>; Sun,  8 Mar 2026 01:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772935113; cv=none; b=R77JOgezyBvJ9hFgnRjhHkzaUrsqsZSRugWKW/amKvNIjq6J8b7AQJfNSLBKI2jgU4J/tCNK4/HgUv2lY9ExUz5HncKmJ9wMpS0SAnyFA90ZVbvgRRQek7z99SjzLDLAX2uPp62QNENIvkKor/+RpPOjXn98c5OUF55kaGDCbrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772935113; c=relaxed/simple;
	bh=laQV1vVD5UeRPg5aVrnjS2a8ORtfFMt2mFTQJwLRy0E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u7JWtq+8n4Eh9lv/LI0SgOdaEjoEYoF7pcYFjQjSTVzVtQAJE8B3/ZQSdsrw1hE3YnppPQqpOeBUhtFhgfgTP0okO2GrOVberHWQaMbL23CrkXqmGA2ANkGAsP5xvwhj6vOheEUXv3vCR4qKBGyekhLLU5bR1lYRQ+4mOS6Won8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JGwb2NVE; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JGwb2NVE"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ae41544dcfso83296635ad.1
        for <linux-leds@vger.kernel.org>; Sat, 07 Mar 2026 17:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772935112; x=1773539912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M0ZlraAcI3wbiEU1l8IOyIiSX6Jx0dmte314dQ86Jm8=;
        b=JGwb2NVEwNw2An/04bw68DfA6IiT3hH65xOzO7/87I7gWnM5hpE9LblYibdti7gby9
         x1HGKn5wIljNTbtPqkhMRP4XIKXFw/TCj3lDXKJnNQ7WpJz/XEEzrnCmUWFGcc9V5tIa
         3spaWlGfmvn1UIu7RszIn4ZMGQyOgWG5adFSBnqFLA6nHvDBsQippRXAukQ64+O5S/7b
         TKhFAzQKF/XFn0YnLR48H4gds3YkMGrPBiWBHrNrfzGSPHb+zdz0WUHcBsj0P737iN6Q
         cueExu+FOVTaFHgg8k8OzmTFADq0G21TaXN4jUV1IpBWIDjSEcQzDbyIWJu/L7Tkp1MJ
         jWPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772935112; x=1773539912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M0ZlraAcI3wbiEU1l8IOyIiSX6Jx0dmte314dQ86Jm8=;
        b=XnRx6/WwCa6ge2g/jwbneptDs1XQAuzIzwXzpIqtBw4Iwvre3QIrW+edWuPS3NF60T
         sWlluvQxUSRnHN6agV6vd3UAowgoIxByl5Er8sGyLqntlBZeKg/OfvRgMSWier6PI+RK
         8aOfWFNh4vuUc8gWQMKqXX4HqPAWYdvUyUN8cXUyMAp99bgs/n2k7BNyG/853yoWagM/
         hKhLKlgSCbftnRt6NuS95Nj1S/ZaB+4gvq9ne7WC3ypwPoynXA7yKecknSzmyTAhcjk4
         owmbAfEn1p0p93A+SXgiK6OsnP5JGQiJ4XjhXv9hbFpVTsrzJw2PVsZyN0ylVjiockbu
         uN5Q==
X-Gm-Message-State: AOJu0YwWVUiuAUMmEtIwmsVLMGRA/4ofbU2QcDgw34dLTOC6UeMDjGsZ
	ybRaa+zCsV3SaYzb/7L0kIOWoXp26g/aRxARHqvPhlgqbnGA4c7v/A5+
X-Gm-Gg: ATEYQzw4MHmpk+Wu1atETc77HuUqpOlQk2v+NQPzmfwDE+u/4cDUSs+rjM2XMl0vcJW
	lRRhWSZOqx8GJo41i+LiRu4gE1D83imyE/nQN4YdtNyIkVpwd+viIfrSO0g6RX2o2xbk+E4OgqM
	gGtuXi0gSH8HBaodfWUJgDu4ISckQBePFqMlBLVud665eo3adR117wiQLMsxGDzgJUTCQjeoo9V
	LxAW4ql9o+HeCgZS9YyM/A/ijoF0PdgL3X2LEXyyBerYp1CRxQQIqU2kMK3N/SMgS2Bxn14RFuk
	BTPi0u7CYtSAGQUaRFp23iyaSmjJ+fFhUSvw4IVWAFJgqqOa6ioF8tW1wgQG7BjrlQvc570/jtw
	zXtrki6zfx+rOk//p4/q2mnI0m9j3OSVw4y0kxEFe4mQAZXNSXtUFnQBfqxwx5Jz/cOC7SkvNN5
	smvPqqMLtFEFwWNnBwQLOEqF3sUa7r74GXqqAXqOADKLQrHqI9vBY=
X-Received: by 2002:a17:903:182:b0:2ae:8077:b1c7 with SMTP id d9443c01a7336-2ae8242d3a5mr76258435ad.37.1772935111675;
        Sat, 07 Mar 2026 17:58:31 -0800 (PST)
Received: from localhost.localdomain ([202.63.77.193])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e57b1fsm84141835ad.12.2026.03.07.17.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 17:58:31 -0800 (PST)
From: Bevan Weiss <bevan.weiss@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bevan Weiss <bevan.weiss@gmail.com>
Subject: [PATCH v2 0/1] leds: syscon: Add tristate option
Date: Sun,  8 Mar 2026 12:58:22 +1100
Message-ID: <20260308015824.2318366-1-bevan.weiss@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> My first submission to a linux-kernel list, so apologies for any errors.
Apologies, that didn't age well, I should have looked at the file history.
It looks like the module=>builtin was done before, so this change reverts
that.

It also adds MODULE_DESCRIPTION and MODULE_LICENSE along with the tristate
Kconfig.

In OpenWrt, this allows leds-syscon to be .config'd as a module in 
subtargets, and then included / excluded from rootfs filesystems as 
required for specific boards.  Without this, every board would need to have
leds-syscon compiled as builtin just to provide it for one specific board.
And OpenWrt devices are often space-constrained, where this is a
significant concern. 


Bevan Weiss (1):
  leds: syscon: Add tristate option

 drivers/leds/Kconfig       |  4 ++--
 drivers/leds/leds-syscon.c | 20 +++++++++++++++++---
 2 files changed, 19 insertions(+), 5 deletions(-)

-- 
2.43.0

