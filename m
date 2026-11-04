Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793795846;
	b=ABuJ2AU/5GjG6lVGyTW+lzAc4bWBekAhjL8nh68TKtEgTqFut2WypgyXl48YFONHJTBL
	 3CQoUTBjpLG5XiFy0DVqpNigX87C1BbnaQj4RDDlCf7LgPzommqyFZm1KmyL73Akh4SDd
	 o0E+HUxK+Na1CtWAcCVUPxXO7jB88kvo1MFoSO5S5K1FDqAzi0MvNLEPAEpDThRZ/3+Sq
	 2urJAWWvRe4IVi0DK4a4z4Wx+bdTvch95T9M9N26GnlIb4WZB89h+tSPutR+Tbimae7dm
	 eiHoyt3jM4S3MwWGxAqg0I3uGs4r1upWi/8oGLqx+CNdd+2fT7z8WG1hbrb/+WF8H1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793795846;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=74V3jje9GT/TZJsW05wIZrY30Lopn0gs+JfNYxexip8=;
	b=HDMnnerxAdvr3jPHE+YLjdC+iLVvgiQqpfO9uShAeXOrDgB4TTJro6mFSkHvtjMhC+fK
	 JM3/f97zoTfnMcxI+LWDHUpFEnGUz1pvmJyxD/Y3AIaDqTNB8yXNST5UP/vXFiBCWscvM
	 fSoLbyZU67CtEHlDZ6sO3dDr0+MrIe4b0Z5qXkw6ERIurVG0DMLSK4+loFcUbmsjcT0gp
	 tRcSVN9o96ocT/Pa+XUvWZneDM16buOJFehnJAPYQBWh4ougxQniMtb+DreIVtY8gQ/2M
	 4XklCoY85paINX+YSrq8rOh/mG/vlwwR2dGmXcNA7hcTF5mXhG3q1GocO395Jd1uvBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KI1fnD9u;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD28606A31B
	for <linux-leds@vger.kernel.org>; Wed,  4 Nov 2026 12:37:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACD28606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KI1fnD9u
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e0d885929so529689f8f.3
        for <linux-leds@vger.kernel.org>; Wed, 04 Nov 2026 04:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793795844; x=1794400644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=74V3jje9GT/TZJsW05wIZrY30Lopn0gs+JfNYxexip8=;
        b=KI1fnD9u5hRLJSh528+5RgPH+B6BuXEsua+yxCr1VK4w73hltwPhHIGF7s/Fa67ftO
         dYnUdAwZmfhfnymgo8uPMS2IncIOIgRjUQOrbTFd+nMD1Tbxj/sXz466qpNffWMy8vht
         oCVKswanKnTEV7asx6O6Eii5ZQxTOjCOaeXMzihaAZBHh45cQ573/JfhtZKnme437EMF
         +wHr3K3BH6yhBAqAXHBoT+yr0MDGuXqtw0CcjloG2bYl6EQtOBDl4H7MfhymZmqIgEvW
         LWr5J4Y8qR34UYq0hAcCcy+K4DOarrBQy6U7GA2idfvll90gPbc2UmhM7lPzOCC+uS3I
         Q5aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793795844; x=1794400644;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=74V3jje9GT/TZJsW05wIZrY30Lopn0gs+JfNYxexip8=;
        b=OyNV80TwstKybpQKML/RtD1s5i2Ky0G5myhdVhpratP0WmrIXhhfNED7AEIEdKauyR
         D7sFW5NzQju5jBsLt2PK5dl7hRjfjPbjivSygdFpW5NldWTdDKHdIz27EtwFEEWfJBOv
         lPsRrfrRyczqYMknBOc7paFNEglWr2XFba65RbQl65K3r29HBOaQpgwZOCVYXislbeCU
         u+H0TuCAFRgpkwzjQW1bWju62LCQV8eMQgJhrwZ6NSb55xocPmtPBy79tVI7lDteLPgt
         b7g6iyyBrWy6WkNEPu4PbWCF9hPmUgXqnS9HXrbSOU0zhDMxfAzwkpqNm8jPiUKGczuq
         7yKQ==
X-Gm-Message-State: APuU4Z8EWk7Jrfw9YOtBYaIPDln7hycxU6119bFrS/edcrckP570RbnY
	grJM0utgBRAT0/I1NkZDLyG48DeKfxC+m5UhWXw5cekxs6NaSGqixn9P
X-Gm-Gg: AYBFou0SS88eiJ9eksZ5kEEBc9r40PSkPbYomIQu1S+ysa6dg8yknndSk82s/dY2E9x
	eUwHd0BVSZT2ma4j2gSzK4EfdjoClcF5wo5SEPBB1B2jJJmjn0JOVswr1JWwgMMO7D6zNCYV4r0
	wglJUj8hIYNPE6FtBOk2eFyUOlOO6CXJKL0Ma6ucKJB8Ops5g5FLEwOwnfYcYpoa5UOZwYo3uYg
	3Tp4grGDOBeI7YxRE8P9KiikcxCewnl6vu6Do3xv3hjRUme8ZGNtwwKywU21iilbqhnJw/uXHAt
	FNa0uP0qokPOrH7XLB3fzpBjgg/Lzg8qR9zXH6rwWB8Gsjf5QndzdfqyaJ/vzjf6M0LCRIKjbz8
	Gq4SDjaOOskwI43QpyUh57Fr7lA6vN/DYIyFRCGIgvmODFjXX/Xs3h9iTps6AQMs/60DuQnuebH
	f04Eqre73D44Ur8MHWrYxBW3EcIQI9KSxzZed5b7RryD3bmJcSJRjVzz0hxTwsN6ZySXH6X+kOo
	OpBYNYNEECCzcGdT3g4XwgIEDxa4y7S+rVrCsPkqve1H8ntdnCFpwUVKKpsIauohpIDLCE7rGWQ
	0qQbSWL5IEK9/P/rU5G02I6+mZP89oejyDFuXA385LAUry7NmA==
X-Received: by 2002:a05:6000:2c09:b0:48d:ff06:c626 with SMTP id ffacd0b85a97d-48e6e50089emr35262303f8f.35.1793795843957;
        Wed, 04 Nov 2026 04:37:23 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed553441sm3386155f8f.43.2026.11.04.04.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:37:22 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v6 0/4] mfd: aat2870: Convert to use OF bindings
Date: Wed,  4 Nov 2026 14:37:10 +0200
Message-ID: <20261104123714.234634-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Document Skyworks AAT2870 into schema, convert existing driver to
use OF bindings and remove platform data, add support for
in-supplies.

---
Changes in v2:
- fixed led-max-microamp scaling
- fixed max_brightness parsing
- fixed regulator init_data and of_node passing
- of_platform_populate > devm_of_platform_populate

Changes in v3:
- removed max-brightness property
- switched from dedicated max_brightness property to dynamically
  calculating brightness steps
- update regulator registration to use mostly core regulator framework

Changes in v4:
- set max_brightness form aat2870_bl->max_current instead pdata->max_current
- switch gpiod_set_value() > gpiod_set_value_cansleep()
- constify aat2870_regulators
- max_current in bl switched from int to u32

Changes in v5:
- drop max_current from aat2870_bl_driver_data entirely
- remove legacy gpio and mfd core headers
- headers in aat2870 sorted alphabetically

Changes in v6:
- led current set to default matching driver behavior
- max_current initialized with same default value as pre conversion
---

Svyatoslav Ryhel (4):
  dt-bindings: leds: Document Skyworks AAT2870
  backlight: aat2870: Derive brightness steps from max current
  mfd: aat2870: Convert to use OF bindings
  mfd: aat2870: Add support for VIN and IN-LDO power supplies

 .../bindings/leds/skyworks,aat2870.yaml       | 124 ++++++++++++++
 drivers/mfd/aat2870-core.c                    | 133 ++++-----------
 drivers/regulator/aat2870-regulator.c         | 160 ++++++++----------
 drivers/video/backlight/aat2870_bl.c          |  78 ++++-----
 include/linux/mfd/aat2870.h                   |  95 +----------
 5 files changed, 264 insertions(+), 326 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml

-- 
2.53.0

