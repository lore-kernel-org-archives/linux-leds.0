Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2293427FAF
	for <linux-leds@vger.kernel.org>; Tue,  4 Aug 2026 21:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785877662; cv=none; b=Rchhx17+lpZBINyVM6h5skzWX8wEWy0JQKAzD5jtv9sDEU9teRL8tihlQb1TndJlYnTBc+aYXuO9B+glIWkNQdsFkeYUgRXXSIM9T6NqPTWM9ZMI1Z49NEXVd6u9bjtuTcotOR+ae9eTSYR9mofK7MF9rq02umqavXRlTX0RgvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785877662; c=relaxed/simple;
	bh=M94F1PqXP2R4azTv5VsBrw3fcVY3YhyrZvCDUpvojig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=McVppQqnG1A2ghzFSpL/oxWLelnZhzbAZ4Jri5QuMSZnfJU84f10WPhVL0EBLVm9tWKSl7oSs0acOi40IPyzFmQgr6e2aM1vC7+iXWU2RT2v0lCF8io/Rohkf3PPRK38kC+H5f6tzMQ5uBV8PayPQ1vuic2jkF4ZKiH5m7QIAEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s/JyTPzm; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s/JyTPzm"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8486ac3f347so1607973b3a.1
        for <linux-leds@vger.kernel.org>; Tue, 04 Aug 2026 14:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785877660; x=1786482460; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5VUaS6lIR89fzUXE8jE1kCkmVqVFSCHPmmwJhW/Xieo=;
        b=s/JyTPzmzEy4CYMFx0MDLuGE+Hz9l9t0GpvdDSsuX6ku14z12aoaDR2OJu60H7O8VP
         1fl5KymTjLMPLGt4YuDWeSSUZdNkRrIWHhaB2fwnW6LxD33/8HSOxRMuxD36+cIAeSFs
         oAWrzA2+GfzsqWbs2n5swGClIIwf+vZo48iZgoxXV6+Um2UP1QeHj69XQ68xUcm6E7Zr
         Dz+nSSlWrsUXfnFYtukGJgoQ4RDl/bNZNIt2MbviTqPz/56gAHTX4OaF62Ipi1qUlPkN
         rJc//7Le8rHgmUaIxWbz3FO9JAeIRxzpT5Nj4qO5sD//y0RXvFTgzxLJyNXJAhhpoYG+
         PRQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785877660; x=1786482460;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5VUaS6lIR89fzUXE8jE1kCkmVqVFSCHPmmwJhW/Xieo=;
        b=rjOf/3oB03eX8Kw2ypVTpzJ2oZFW637+ixyTUYZu4LxBlvpoMOkFUGACjoid3RP6lN
         hz0N8lGw3iM/FAKCvaFTG+a1wSL1B/g0VU3/v1bHl8HgWtjC5XFv9NnAZlXJ3a9Mo41B
         SvLUe5HGCtW9F9SoGT/z9oU9hvLkw8v0muqeuRFfkt3du+feI0Co4udyvERcznDrXTav
         pxgV286EkthMh6W45khlObfDGt31C92LJ2Ai0OUVeBYgQlnvJCXyZxbxVsW5qeD++8RE
         ZhNO5sml+RGuXsxG+6NsEZTyKGfHaPxybiH2KrLR+cW7cqk9APGO6lBvOz+4zfcXQVqK
         bGng==
X-Gm-Message-State: AOJu0Yzwg30uo1SNn3xlGhK6GVPbXTbakB+oG6ipWXBGve0emtR7zSe5
	dc2gLxDd6a5Sri/0edhRmSv6CSCBpW7xnkpReMgJ6U+MaGNVbgWNPuf7
X-Gm-Gg: AR+sD12+7VMf2s5SbH9i857Bb8EfIh2YaqU/Y4YLbow7Aj1LoehRJLytX04QOFnia3K
	ImP8IadHofx1jx38COd6Lir0d8i/Y5wJuOeGolh1Q9FJQ+truZd4Au4ayk6FndiCr5bn9KQxtye
	jq/cGByPR1zUm1d05wFvpG9cK4m9TCMnRug1I/U4Mf065BZ5DipR/4nhtiDfl53VgSRq81iqmNZ
	msGTaQKvrCar4vc4SORBDwxwbCMBU2srX5SfWa6uJqVkZ8pNSsICTbLJEfwZmG5cEJLcRZBBrfe
	lwZ/eUq+paSDBNMyYDK3JbjynpVHmQ754H9igYTQa+QtNo1ujPtxu7x/BisF0+GO2WWvhwh7v1a
	w0cNtFB8fgdCXfJqPVxFfYdLNgDDI7+j5I5c70S8pch8Iqx9AUakOfIlGn/rvx9qyj0SDND20OD
	ErMOSdzn+Zu9cbnbXYqsRMtxktz11MLA1UXHTAcP43gRQUIfn8dm0Qj2R+uZZVrhOlzibBx9whR
	+W0R6wFcsVKyA==
X-Received: by 2002:a05:6a20:4320:b0:3c4:3750:2c03 with SMTP id adf61e73a8af0-3cb6c7b71b0mr5878476637.9.1785877660120;
        Tue, 04 Aug 2026 14:07:40 -0700 (PDT)
Received: from localhost.localdomain ([12.162.234.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca6576b7sm6062339c88.7.2026.08.04.14.07.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 04 Aug 2026 14:07:39 -0700 (PDT)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Peter Rosin <peda@lysator.liu.se>,
	Nam Tran <trannamatk@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [RFC net-next v2 4/6] ptp: ocp: Validate EEPROM board IDs
Date: Tue,  4 Aug 2026 14:07:35 -0700
Message-ID: <20260804210735.48116-1-ahmadexp@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <4ef01fa0-969f-4ec0-997b-5f5f3f67e11a@linux.dev>
References: <20260803205011.1249-1-ahmadexp@gmail.com> <20260803205011.1249-5-ahmadexp@gmail.com> <4ef01fa0-969f-4ec0-997b-5f5f3f67e11a@linux.dev>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Thanks for the review.

Agreed, I will use the 12-character Fixes hash and split this safety fix
from the feature series so it can target net.

One detail about the suggested snprintf(): the size argument limits writes
to buf, but a plain %s still scans bp->board_id for a NUL beyond its fixed
13-byte storage. I reused buf with a precision-bounded conversion instead:

snprintf(buf, sizeof(buf), "%.*s", OCP_BOARD_ID_LEN,
	 (const char *)bp->board_id);

I have reduced this to a standalone net patch containing only the over-read
fix. I will rebase the remaining R4006 and V9 feature series onto net-next
after the fix reaches it.

Thanks,
Ahmad
