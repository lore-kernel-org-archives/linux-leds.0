Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D61F486656
	for <linux-leds@vger.kernel.org>; Wed, 23 Sep 2026 10:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790159438; cv=none; b=iEq66p96ZvlgJ0zCL7qUT6pVGre4cGhPFP3SVz/CXok94wDp0WewD6e24x7NRm43FlgxVD/oKIRckHnjSQqG5XYgwahn4AkkDxDCWh0T2cXw7G8ZlhiwiYQCwb7PIpNV3jCNRyp7PbdWu25KTJDOUwpev2ffz0JWkk/9Q45dRyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790159438; c=relaxed/simple;
	bh=4A2rVpCglcElPTI0FX/kZ2D+r2RLsiom+HOo0azm9N8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SXi1gl5fxfzX116RJ7vYb28JoLmRVeISweDkZ2yzZehsgXnLC1KhLfnDO8zRFDLH3gPyG5oW4PCxA+ngyQtuUs4bpnXmoaXm6mKbNaa6mTfC910Fad/Owk5FkHySGQIUilLkKUdDWR6z2smU97Jj4a2PZU4mOzn6chba3YNfUQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BFfhvlb2; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BFfhvlb2"
Received: by mail-pz2-f42.google.com with SMTP id d2e1a72fcca58-86efece610cso399202b3a.0
        for <linux-leds@vger.kernel.org>; Wed, 23 Sep 2026 03:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790159422; x=1790764222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SJQcE+RNdWTQ/Zw3ZZ29eF8rBGAX/7jKIXho5Hbkepo=;
        b=BFfhvlb2YkH3g09h5WLKDhAtqLoJ8CVC+uUPhVIx1QFLiUIfMAkqttQJc+ZteSS1QY
         ggf79iexq7eT7FdAFJ8zJZQonnPRm09xH2dSgkwcEsu0HDz7v7a7Vtpth5wr83IusWhp
         iBlc5rLC1cyneu8QUKYgx0vDSCkXCx4qrhgQ+tvLGjyHrJmtQLt/C+9PNQ6OS01XaKOD
         /hJrwFdR59ESMo3ZUa72OqZ2XHZRLHVGAwN3v2VW/KnY+1UpHGepu7x18ywm09xwfF/h
         OM117WKmsJMvSLq7SyVKQdiXq9Eyeb05KNVmIw4rWTuhN04OKbguUwz8G/UoaobFnVIq
         CYQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790159422; x=1790764222;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SJQcE+RNdWTQ/Zw3ZZ29eF8rBGAX/7jKIXho5Hbkepo=;
        b=Cgs2k0Zz2oy6zDnaNptewFrM0IAqB6BR8OwaT4VdHofAtgCFPC7pwmDNDed9mRX5K9
         F4xWkZLqDWXRRlFSbb7fzfUAkffW7L+gIZv2OV0o/OVLsncICTmpf6YArVqOg4vSJLCx
         fowHDf0xgIBGbyelUoJ9GwIljFLFGXylKLq806fQ1F3h+Inn9znZN/UMoyEwEqndmMC5
         UOQDExMIssUJMkEmPN5LfTd6/JmKvbW3aBF49oMScX4oNabkmqynhuqtyypLVa8Iiaxk
         Bfuy1Au4vINJqgd4fw26tuZzxGMarahd/692EQVJW4Kq4T9VoyfogzQbCdmCwZNOjXBi
         ygfg==
X-Gm-Message-State: AFuF++nbcgGmOlO/8MwtdYtSMxKSga1NcmS1S0NLs3G63ovKvL3Be0Wn
	BRjtXqy7DTi53XglOEYZ5b+g3FrF4q+SsM4u7maw6k1eNGwnoampnVu7G4wlrCVPse4=
X-Gm-Gg: AYBFou32dsXOm/d/FPJBnZIQ5Ax6J/dyRyYqmRAe/zCnCnUwcQ4BGVJQ7bEOVRfqrpx
	L9+f5d8TMWHPti2XKGA93rpkS65WM0wyucIqT48ay4pSSvURvZrh5Yt2Kdr7Qfa0EeDhQReN+Ur
	pbGUsA0vG2kW6YaItZL56goljnWvrsIrob4gsAShqPGzQpyirzC22i0Kb+zOFsXVlf5LTkVuJ6g
	2fAFej96x1vF1dG2z1RvI1GMmP7tZS6WrBKEAd66PDYSj9fW0TD7B62/ytnfbMzA7IdkysVZXAQ
	uhxDrEPDYEgcMVbMayvE9JHaVjb9LFfjRTxWQgxE6upFipZBugI8WH1OfZUzqGByCpQuviX3op7
	BH1ijSy6cgVoeKWVqY+iDiZz/GDi0KH/HzUBU8WMp17dk/fEAw/wzsq5VEWwa3vAU3LASqiHwMg
	vgAtBut779Plw6MFNqKvaTI3jVD3hE2NAb5/9dwPLDqDjjPL59oNmEPoAjYB/BSzdgW94M5tjWe
	F9IfTbqb5fmo9ih
X-Received: by 2002:a05:6a00:1489:b0:86b:b308:b926 with SMTP id d2e1a72fcca58-87d1a2bf425mr2002629b3a.14.1790159421340;
        Wed, 23 Sep 2026 03:30:21 -0700 (PDT)
Received: from ROGZephyrusG16Air ([240e:b8f:977f:f400:ec2a:b15e:fef8:70a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1d5c1f21sm1048685b3a.32.2026.09.23.03.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:30:20 -0700 (PDT)
From: Liang Haowen <nbg2974@gmail.com>
To: linux-leds@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	"Martin K . Petersen" <mkp@kernel.org>,
	linux-scsi@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Denis Benato <denis.benato@linux.dev>,
	Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>
Subject: [RFC v7 0/1] leds: asus-aura-scsi: Add ASUS Aura RGB LED driver for ROG NVMe enclosures
Date: Wed, 23 Sep 2026 18:30:14 +0800
Message-ID: <20260923103015.2365773-1-nbg2974@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

v7, as its own thread, addressing Lee's review of v6.

Changes since v6:

- The driver moved to drivers/leds/rgb/, where the other multicolor
  LED drivers live.

- The series is submitted with git send-email this time, so the
  patch format is the standard one.

The SCSI device handler attachment is unchanged; why it is a device
handler at all, and what the in-tree split should look like, is the
open discussion in the v6 thread.

Everything else is unchanged from v6: the hardware description, the
scsi_device_handler that does not claim the sdev, the multicolor LED
interface, the protocol handling and the known caveats (manual
attach until the split lands; SAVE on every update writes the
enclosure flash, wear uncharacterized; NULL-parent LED registration
to avoid the sdev reference cycle).

Liang Haowen (1):
  leds: asus-aura-scsi: Add ASUS Aura RGB LED driver for ROG NVMe
    enclosures

-- 
2.55.0

