Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B433644DC
	for <linux-leds@vger.kernel.org>; Wed,  8 Apr 2026 06:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775629787; cv=none; b=NDajdVJO95Om/RaDm/yYYmifVdElsMRYpg0PC9FHHMxW/EHx+gBL+DYDubF+WOtBUx3UjlmVhFnEfUE1Iv4G4exQi955f6Y5wg6vvlV5MkkQsngH6BjSmZIEttxXxQYpperbFCgU8pDj+hK3vuIoD0K+YQsgORTonrO6b+bmH1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775629787; c=relaxed/simple;
	bh=Ojw2XeZPBcO0787VyUie7rj+4Ma7g0T8xNVC4PF1Jrw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lfbkazr5iYkfcVlKfVdwFf19kKzViVo7pu38Ms6gW6pOJHwcLurV4MlRSJ/yffd78zZqsD3ePD2jQdzm5VaXDAbekjB+aakDtz0MtZ4+JsvZXLi1I45U26AtWH01e4aI7T+GBPfWXb6+9mTO1XhgdAI+he/RoFTE0qGfoCZmBro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=li+w/e86; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="li+w/e86"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43cf906b007so3061909f8f.0
        for <linux-leds@vger.kernel.org>; Tue, 07 Apr 2026 23:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775629785; x=1776234585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q9VJseYyqjYECOQkMOXlPXSaVSDXv6yoeL00c5Xqt/k=;
        b=li+w/e86GuxHUL0cmny1PDt423ROC8L6EnSZjP0jTrnAMqC8THQALwz1ghM/zv+tOB
         p4EQhrPGQMcdtvJYNQ9BTBoPeuJAazAv4CxHDFdB4pR3uivWxP9KE89PYCVve0PwLGJk
         8MNF11inYHXe3Mgxlr6K5ESIQMbhrWUydjTDqWck1hkrgg4fL+mQLKHpxCUJ36aWjtws
         OKf2F5wAxfOEJK3kbfQVGhf34amchk5mTmKOJjipctQrVyEK0dX2M/UK5+FRHpUd2Igb
         ujIsiAmrE1+ghb5OVl6kIJdKbXNUXofiGRKuei378kadBqVOljPgwHQPXPEwwfaEFt5O
         mEow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775629785; x=1776234585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q9VJseYyqjYECOQkMOXlPXSaVSDXv6yoeL00c5Xqt/k=;
        b=cIxcmXYKhdct1UOKJdlyGlNz8R11YkwJdrN2Vtduwg+g1ZK36fp5/4jwk5SOxLpdBY
         ykBznP8whH1NA2lH5VnkERt454OyuqXOJWIqulHp9Mt+eK16VQsfezFnQ+/Va9HIUKmx
         l7XGTUsQsTUtmXQPm2UqHvuYRq7GAw22bVkEI7I8zUFTslGit1Ieo9ntegaLNJcSGjTU
         XXJ+OGqL9CACYLrSBKSSEWpvBYDISOfDD4FoSLnCDVYEQbOsviTVMGynnQsUIiFuxsQF
         qrOMqOpDw8t7d6btngnEDDGSrRW9M2+kFHyRTpE+hTOZC6kWSJEJylBAkpq/d+A/sPNF
         958A==
X-Gm-Message-State: AOJu0YzdDWGIgOJqfWXNT0B/LkqlLmluaQ+/PE1CjpyVa17rXskFy8wh
	DAkWSGxDFBbbzvyRaiGrt10poec28b8ne784wdROj0fhLD3XG4Q/SVtV
X-Gm-Gg: AeBDieuMD62O1Utz6Psa1Jz6w7myPXMo9+8y6de90ZKOFmR3xkC4r3rO2G9oopQv8/X
	Tb5qxK7ZQVJ+3llMn/Ks2JVstBKH1klaCMRCIqP8VqlNY0QKsKqc8QeoBmR4m6XZfs8fI1POb9j
	1389DNYccx8i6ogEkRF3tx0wo+G5+ErhH+N87rRENz9v+f4vAqbs04g4x4uVYAvv9JHcF8DAkQ5
	LUcpMlVhJA2Eh39H3EA3xO6/4Qvg6FKVMWxS6fZ7mRciMeO4suobU2Z7zcBDfDT4oJ8ec0RvR2F
	5aoqwXTXfUJ6I+XcvBeVPf6pV5sRkyiwWvVbAGLDWWhTJZVF3A6NmoSsZMntEKogh8IXbhXjhX0
	k7EVNyMCF6gJd/SZC7607hAJKStqcxc3k28wMerOF5/tpbTlJuWmbGvzKGCRSfNqYX39kOq2ivX
	0T9kOf16yxrM6F8ZFEZolzaW6Gr+DbmyiXXmfBWsZJXrU=
X-Received: by 2002:a05:6000:40ca:b0:43d:a58:b076 with SMTP id ffacd0b85a97d-43d292e89a7mr26799287f8f.44.1775629784416;
        Tue, 07 Apr 2026 23:29:44 -0700 (PDT)
Received: from PC-DA2D10.beckhoff.com ([195.226.174.196])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f5016sm59905521f8f.33.2026.04.07.23.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 23:29:43 -0700 (PDT)
From: =?UTF-8?q?Corvin=20K=C3=B6hne?= <corvin.koehne@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: linux-leds@vger.kernel.org (open list:LED SUBSYSTEM),
	Pavel Machek <pavel@kernel.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Corvin=20K=C3=B6hne?= <c.koehne@beckhoff.com>,
	Ashley Towns <mail@ashleytowns.id.au>,
	Dan Murphy <dmurphy@ti.com>,
	Gergo Koteles <soyer@irl.hu>,
	INAGAKI Hiroshi <musashino.open@gmail.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Olliver Schinagl <oliver@schinagl.nl>,
	Pavel Machek <pavel@ucw.cz>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Roderick Colenbrander <roderick@gaikai.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2] dt-binding: leds: publish common bindings under dual license
Date: Wed,  8 Apr 2026 08:29:42 +0200
Message-ID: <20260408062942.7128-1-corvin.koehne@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Corvin Köhne <c.koehne@beckhoff.com>

Changes leds/common.h DT binding header file to be published under GPLv2
or BSD-2-Clause license terms. This change allows this common LED
bindings header file to be used in software components as bootloaders
and OSes that are not published under GPLv2 terms.

All contributors to leds/common.h file in copy.

Cc: Ashley Towns <mail@ashleytowns.id.au>
Cc: Dan Murphy <dmurphy@ti.com>
Cc: Gergo Koteles <soyer@irl.hu>
Cc: INAGAKI Hiroshi <musashino.open@gmail.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Olliver Schinagl <oliver@schinagl.nl>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Rafał Miłecki <rafal@milecki.pl>
Cc: Roderick Colenbrander <roderick@gaikai.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Corvin Köhne <c.koehne@beckhoff.com>
---
 include/dt-bindings/leds/common.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/leds/common.h
index 4f017bea0123..b7bafbaf7df3 100644
--- a/include/dt-bindings/leds/common.h
+++ b/include/dt-bindings/leds/common.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause) */
 /*
  * This header provides macros for the common LEDs device tree bindings.
  *
-- 
2.47.3

