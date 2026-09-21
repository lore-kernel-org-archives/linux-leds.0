Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EF846C859
	for <linux-leds@vger.kernel.org>; Mon, 21 Sep 2026 09:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982964; cv=none; b=i7j2DYJhBVyDprEenGubY7+A92vF2UJm1GqW1lzluq0k/1f9+p2e/U0MPpdq2tNRqnQ6yRoqDjskqwCnyzENOrcZ5ZGcbldN9/HObyKjcigiqTjHaKGIrQ/QamST3z4pQyCBAjldx+unWFVqtP85RBs9pKy0poxyeNN9b4hkZ80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982964; c=relaxed/simple;
	bh=wrp//4DuN/TjU6JeusomqkHaDOiiBC/IS87sp+99l1Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VvtqajrC54xqk9iY1NdZrujOMnHcxULgbYyHXlhxAyyVyY4k0XqQBCmwsjwpnUEF4/ECu3bcAIKh1plyK9W0F1G9VrO1X8TOCFf3wUSD3uuXs4J6gt84pn49T/QxE6GQIQyJ5SDb9aYqP2OYfgIRBBXEgfVQnM/ZBIukVPxqUDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nqzsindl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nqzsindl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB3DD1F00893;
	Mon, 21 Sep 2026 09:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789982962;
	bh=wrp//4DuN/TjU6JeusomqkHaDOiiBC/IS87sp+99l1Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NqzsindlmN4bHxuEHj1/ZsNrSvqHL+AB49tM6RAGrUrmn9a7S4Kpwcwf5A92x+Xl+
	 +/33x2ElE4+aF+tYN9lFUmqBoZ8/4B0f/mPuRI0kSk1doGT6ZJFeiJuXiBcp8wtYKJ
	 GoTOASFkmNDJdpxduoIPFbcP25yv4eBstVquAWgN1RvILYM94ku8adA71LM6GbNjBE
	 3sIbE9Du89mF0fYUeW8BkqOh4Ptw3LcIMa1Zd1zJbRSe+3OG/fAr49MUWBLOdwt2qP
	 L1ypjyoCUy1hVCSZ/l1PDf7HtGw7Xcw4oMG99jqrC+GNWg/3gpbXcr29ACnKZY8SdR
	 GqrJSYggemEiQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] leds: flash: sgm3140: fix child node reference leak
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guangshuo Li" <lgs201920130244@gmail.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260921092128.346375-1-lgs201920130244@gmail.com>
References: <20260921092128.346375-1-lgs201920130244@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 09:29:22 +0000
Message-Id: <20260921092922.AB3DD1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] leds: uncapitalized commit message description
--

commit 2a50d0447cec030d24466a0bda14c4fe595d02f6
Author: Guangshuo Li <lgs201920130244@gmail.com>

leds: flash: sgm3140: fix child node reference leak

This commit fixes a child node reference leak in sgm3140_probe() by
registering a devm action. This ensures the fwnode reference remains valid
until after the LED class device is unregistered.

> leds: flash: sgm3140: fix child node reference leak

[Severity: Low]
This isn't a bug, but the description after the subsystem prefix starts with
a lowercase letter. Should this be capitalized as "Fix child node reference
leak"?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921092128.3463=
75-1-lgs201920130244@gmail.com?part=3D1
