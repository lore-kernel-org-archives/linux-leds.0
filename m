Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18FC34503E4
	for <linux-leds@vger.kernel.org>; Wed,  7 Oct 2026 08:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363319; cv=none; b=YIjw8vKlTTwHbAFM6Afl1NQoHUAJfvDqK58o4AkXFvmdskz2diu0iiz9ZhDB8gQ+ibOKaR1vis4kzEoH6ZPqAnbQKVhkn0E254nCKoWGoxD1qhVx6Pt6Lud/wtIpp/L8E/pj+db1r4m73Y/szJS7nrp5CVSXycUjFkgmyVJ4fx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363319; c=relaxed/simple;
	bh=pRig2jwfRvKIPmscPv3ga8MjLPmvBeWTyHRup+5LxN0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iwBF00WQhZnR3pHbRtNzgMALoBALhf+qmU4Y97mEDa0BYa9cWmwRzYWEptIsLoQ/7apazfE4rshYz92tpst4HgAIeZInBDKiDOf1b4yamQ/N2STbA4pciUc1IkscCZfQyXnaibKIdhreVZ/vWcA0MAp0rrywm6KkLyh64fgS5qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JZE17Nib; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JZE17Nib"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a01933b584so14001275e9.0
        for <linux-leds@vger.kernel.org>; Wed, 07 Oct 2026 01:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791363316; x=1791968116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=idGrLQ96uf8XUCDMxXSwM26M1eSYrrZBxKOU5D9zkzs=;
        b=JZE17Nib2Vjng4ryH+LLlIkU5DZi/0OSlS5srF5fkQbJ0gVTCfzC9vEqomaXL/KIR9
         /Ylr6LQoheCY+DpnQFToSd41UPY3pmL2OyNRXdpexscevpzpGUwVMDfyRi5pNd0J+k3T
         cIsNto2JlXJn/bI43xzRMOj5NBo2BVe4q5PiEM9NE2iJGVo7b0WTC65ZIK/6EOG4DNen
         iF+/Yiu7YnFpUa8kAEceg1VW+l5AOtJ6EWQPGWXE2jYLuK/9XCHE2H764fkDyEuzh90F
         AxSILEkkFMckzZH/M7QOakHkFLnF8yM87H9y7DnhFx2f+qc3ntDBhlbMZEyrxU9jaxnr
         WkWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363316; x=1791968116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=idGrLQ96uf8XUCDMxXSwM26M1eSYrrZBxKOU5D9zkzs=;
        b=xU1HhWBqRXte/l/2264Xy85hKyTXP8tPm1vGYFuwvSJIB3qKBfBH54nCdi6NS8kgoq
         bkxPAsWqdIJ9ZzoNdvGNOsyzeXVSdDXNDKpe+m/C1WSF/RhN8rKgwDvP53TVxep/RoHp
         PtuRwJ+XjKhCix1LOp3oplDr0FBVpRiYNKpj2nQRNkF98nfhkaut+Miy0haljNI2nrBU
         kXQ5Y3pvh35zigY0YCsJ49ZClPK8kJ4c31AEWaNd11v0F4dwHK9Bp6Xu+Jj+RVG464g4
         w/izLSXyIN+tPnP1b7DXonk17zWWZTmPuI7elFrQV++pDnpHMoJw5fL998/rZ/AHtl9k
         e+0Q==
X-Gm-Message-State: AFuF++mBX+Wkpnx64wLl+JiYPO5lRPJpP3rBheHL1nxD9YKyTq5f3tv2
	FCxJA1Muc8TY+Mwvj4izQWbKw+8mP49pspEv/FN75XxPJzZ1ePP3UYHy
X-Gm-Gg: AYBFou3ZQ3mr0YRcI00CYjkJBtaxJNyoiotdm9z4DhftydvO6WJXFwpH4MsyTYq3Rbl
	Ikp6ewj0pbK8bYUpglR2VH2PPOqWAaRaFE2P9Aynw/EGIbLjb6dApLQ553ZMsBscP5AnGQBBzCJ
	cvTdVzb5FlKjyb2krDfkvb6E0FSFQ5BVF7lL27g7hiX5apNynrepocIfu7n9puYFUxLa6t+NsgO
	GTwAA7CasGyAoFVoUQgfZ/+cjybChr/ICnewfMlKIdwv42StVFRVnU86Og+5qUGETybAVsTNXPf
	gwxl2tiKYu/7rCNDxSLFBlBp8GrZSUynxBPhYewWDoyB4ZS8RNngd9HLhokZ01SDdX8CS83BnB3
	tRgSomL5u/UhK3/ml3w9NWaHdFpyfwywcBBuudnmpR952bC4VAD4wQdDQ0kFnbEzXtynDN6t9Or
	0a0pZKz7BGs7aAlq2MN6p+lpyefMNjRld7xEsL+KYYaIA5IrxbPcWLs8/6GWQSUS4+Mg/c6yOP6
	hCXeCUEIV77RbhOhIQ=
X-Received: by 2002:a05:600c:a088:b0:4a1:7e77:c382 with SMTP id 5b1f17b1804b1-4a180313b89mr20150835e9.5.1791363316178;
        Wed, 07 Oct 2026 01:55:16 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f493761sm81709225e9.2.2026.10.07.01.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:55:15 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/3] leds: aat1290: Add support for AAT1270
Date: Wed,  7 Oct 2026 11:54:54 +0300
Message-ID: <20261007085457.98762-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document AAT1270 and FLINH pin, adjust driver to suport AAT1270.

Svyatoslav Ryhel (3):
  dt-bindings: leds: skyworks,aat1290: Document AAT1270 Current
    Regulator for Flash LEDs
  dt-bindings: leds: skyworks,aat1290: Document FLINH pin
  leds: aat1290: Add support for AAT1270 Current Regulator for Flash
    LEDs

 .../bindings/leds/skyworks,aat1290.yaml       |  8 ++-
 drivers/leds/flash/leds-aat1290.c             | 66 +++++++++++++------
 2 files changed, 54 insertions(+), 20 deletions(-)

-- 
2.53.0

