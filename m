Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733538;
	b=k4idihPxVZKbqQLqbVduewPzW1UOpLRuhswv6z50zGvuMpmcA27TBku6YZF9erkc8aMn
	 h+PZFoD6PFRNk5gEiCNNLGgE9XWYWWYhi5QoJWzSjbBgzSpx/kPzuP/h9uP0hRnSgT3BR
	 PPtfDb89HrfmPpWmOCUIdJU1b6rVZ4pQYibJV1qPZX6kzvoqSNP5M6qHpOiyPWZ50Ydan
	 JY3Hhz7Ao5Lop1JYbLJixeR6CsCtc7+puuE5sA1Jf3bhI0L4BdQkfKgpkfz7zXbl2v1KL
	 YA5B/p27nlQhzEn/ccgNad4cM/5y/XrIoozOxbm2VhtNVRQMCbzBdQdBcMiFgwzmE4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733538;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3VGERR6jVyCku7AFWTdZ88nDE2sfH6pB8YTCSrSJIH0=;
	b=cVuNmJ01qeqebr3+Cly4PQd1ewSSx7LwOiFzNbNwyYbbPqbMT4Q6tnxSqP8fKRah4KHc
	 +IvG0T7njFj26n45/OWBvYz3ZxV6R2xqkkXZGIRxaGxn8ugdewOjg5OMQbiyuz3IgjK9Q
	 MNEN9Zcw1xk0wiTSfDFe99xzg9j8mzGaekKZbs+43GZVVxmlXHV8Z+oIbCKxvf3ve3VIX
	 aUq/KwREdYc31iN/3g+d9ZUhK9Bb58lWfuJ13xtoY+BrkqgCkqXUIl8C3zwcIRUbcnnO3
	 3ptyUbIeam5dBYNb2dj/yx5AhNbAhWnWCDllcH/fdnCVCIAxG5nPmf3pv2efl6LRUNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n+VIalj0;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B388F606A8A5
	for <linux-leds@vger.kernel.org>; Sun, 15 Nov 2026 09:05:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B388F606A8A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n+VIalj0
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4d473cfff6so343106666b.0
        for <linux-leds@vger.kernel.org>; Sun, 15 Nov 2026 01:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733536; x=1795338336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3VGERR6jVyCku7AFWTdZ88nDE2sfH6pB8YTCSrSJIH0=;
        b=n+VIalj0TasjhIfTTf5UY2D+tyfAVqLrVCiWdkKqppita1mkmg/p5t7LxJc1e4ehdN
         Ls3s9M69wPhAeB9pqo1RvAEflRLqORiTs4xlj4z6AX9I3Ompp77/hm0e+tof/H4Qt1dh
         aumUrir8j8VfgnZiMfGY9n9+/jZuL90k0flDnv+UgD2uF4OHYkKg+265ZibJ6QZiprkC
         FhGFfdgMFJ6U46rbjUqhj0JyLEOda5rmqwmhO7IjSGvKJX8hZGTrXuD94Eo/zdxg1OxA
         OhAcHAo/eBd1UHq96f6W8tA28A0bs+WFfve8QxaznXc0CHXY2uomeAT0Upahrqu7uQZo
         H6Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733536; x=1795338336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3VGERR6jVyCku7AFWTdZ88nDE2sfH6pB8YTCSrSJIH0=;
        b=cSdXKny1U+kpBSyshlzoSN7AMBU2eMiwC8dchRiISVJJ3SLJTWJMU2PCKZ1+l2xIWm
         7PwG0YBJpZeHn2qwGerYXBIwT3CF5dIyL/dDZBo42s2YyOezB+Q6TIOqK4Lik1wxtJA1
         jkewj5c4CBmzquVRWXpTnCoBQOrMFDyIvjyXuL+Va1rgYXwal8eld0h4pagkmwhGAHUM
         rU2XPLbVhx1ukBhCa55QK8AdCfKbHnVjWct9bD4Yxljs46b8tA8uoN7TfCvo3vtLWjb3
         y1qY1On3nvdp+QkPTV7HUqP0UuAxTBeqSRYpVMZ+Dn+vEckEzJhH6toXrsdsGl/eLVxx
         LZLw==
X-Forwarded-Encrypted: i=1; AL+hErF/eF/dKz/mCE0ibRkbtnx/lwjU3vu7IHRbBwRswUuzzM634uiTUJAn7LN52/80RN1+E+75NNzqLW+x@vger.kernel.org
X-Gm-Message-State: APuU4Z8kqxGcfG6jdyoNbG8eNKGtM00+GOtBL5c85t9vHiv8hMMhWuDl
	ONgmEWIcJwa4hA6DqNx76oGEkta0Q9pDehouoCJ/avXLHQmyhcjMbKtB
X-Gm-Gg: AYBFou2qE8mVGlf7uDHZAjMJdwACdVU4oekK6ZoJV0t2lZbDPxDqctIUPVqEbcsHwRx
	hn9PGuBwqbPrkbwmsMlOVB5G56HsDiAM/7zKtjPI/8ZyhfW3CP42R59wyysGe5uquT5G6FFH1y5
	H7Fn5swZ6s7RaQ6yUHKdOV2hm5e7KwOct7dFlK36fO6ZblPo855qp1Sm31+9cjuw8KXKYu22VxA
	sRMunqTXFQ5kAT90m/kRYIYX4ZqS8/bwiuq33wCM84XpSgBqdYKRHdDppWcKu3AOXGoya04Zvhf
	VJLGQ7chmorAGMAiybW750iEHeDw2az/TPvnx4x5e/b0P3RCx4E7NVLMMsr5CwlNdx4oggYNp7B
	PnbAuJRn4xDcZEmcOTcS+SyF2MD/5LNRxrPF9EmqCMnQEkwpPpb88+qWl9nlulJQ3KaUmCHO979
	YRMk946BnoOOtt8IGcljNWie4U6YzWovMc2UZ1VWbqS3gE0TJ0CrQ1QbgvgC6G4PqgyZ0sXKGUw
	uaVwZsKQZOeyufnRie04TwnxVh7VvSR4ZDFlTZ6YJLTfaGspvv591CIj2F2FT+oBSd0zPN/7V7z
	Qj6ptmYUVvMVEM6+RsEggiAsr1bQh8Sf862ZKk1Lj5a2w6GyKvub+KdIO29zZHRQEjOQu2TH8dh
	3lUb8uTlGyQ==
X-Received: by 2002:a17:907:6d02:b0:c46:9ca9:f524 with SMTP id a640c23a62f3a-c50963b6917mr589522666b.32.1794733536111;
        Sun, 15 Nov 2026 01:05:36 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5c4b7sm288103466b.1.2026.11.15.01.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:05:35 -0800 (PST)
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
Subject: [PATCH v6 3/3] mfd: max8907: Add LED cell
Date: Sun, 15 Nov 2026 11:05:20 +0200
Message-ID: <20261115090520.102216-4-clamor95@gmail.com>
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

Add the LED cell name to the list of MAX8907 cells.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/max8907.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index b57c497334ea6..f492ade8e4cf1 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -20,6 +20,7 @@
 #include <linux/slab.h>
 
 static const struct mfd_cell max8907_cells[] = {
+	{ .name = "max8907-leds", },
 	{ .name = "max8907-regulator", },
 	{ .name = "max8907-rtc", },
 };
-- 
2.53.0

