Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA90F4B95BA
	for <linux-leds@vger.kernel.org>; Mon, 12 Oct 2026 17:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791824500; cv=none; b=rTQQ3ftHwBsrdV2FvDcrfCVwme3nXcKAWZbahMrnSU1KVFyH08GKyDdoJGjzDGJsE7iA5m62yOZym/tdzHIv6r8peVa93MTrvOLH0nSO9JuzECoo8u0l76Olb5y+O+HGmfqm1NnWpniiIyguo863dLh/A7b9HIuQBZxL4YW2XEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791824500; c=relaxed/simple;
	bh=e+lF8yRHmI1wJ/4EXajqxJyYCSaNnIVAVRA2VsT//1U=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=TqUCGHylgHxTxp5Ko9nZqP8L/tpMTxOEYEAfJhGQqRZZS6w4ejNDu5PrIi4cOt2AlFNdCl1MxOVfigSmrVsVguyGQAFwnndSEf1vZLZkr4+5QXWdyFO0/5OTeTqss5juPOBfgT7bB2WbTxwqJlHyQW2fgR9NrVdPJJrkt5jV+T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=nZFT7SYu; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=QIfbE2XB; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="nZFT7SYu";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="QIfbE2XB"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 913A2EC0885
	for <linux-leds@vger.kernel.org>; Mon, 12 Oct 2026 13:01:35 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Mon, 12 Oct 2026 13:01:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1791824495;
	 x=1791910895; bh=QWtKdvcX27LYIXn0e7+qLOOxk9nTeNH1MVhsANwCHfI=; b=
	nZFT7SYu0JTe7wXpZ1E5T6WvL4TZVZVW3B0+Zj/YtK0VwFL7qEC4vkh2YzbDRUQ2
	k8fH5Mc/8gY/sNZjCJKBv7QQH/k6ZXbSfX1DxyCZNh5/DaVgwdyYhU3bNSGtF7WT
	hpy0kmjDXEwGKoYg+pPxxk3AEiZxBrQ1ZotqzQ4LIsnoIpa6DQS088zWU01HK+VM
	S9zKUGFLkIJ9zuXXwlsq7UO9fBKzDxVn1bZ5bWDJ2XSa8W6VBg+3PrAeeq/bFYqZ
	y0YgbGKzoPa+l15vhKOwtaB/0zderAUcbwlBwuu5GYnfdZdSdPuqPbTx5uZrMS3/
	6vUWoHMUv0BphifHrisNfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1791824495; x=
	1791910895; bh=QWtKdvcX27LYIXn0e7+qLOOxk9nTeNH1MVhsANwCHfI=; b=Q
	IfbE2XB85UVUAj9gAEfkt8ptuU/DTjNjcOlWLb4xsJ7np6oDPeAGGLrr/IlgkRE5
	QuAUhEAlSfJun3rgDx38HieuhJavVNnYRppQov0nSrlAoSNqKkr2YgWd7+JkzEl8
	K+K/ThdkHkUj2gywwOdQWamJ/sfC2tXVOi+XbJLJiHK3qZ2RekgpAUBVprRxO/7t
	VxJQomYwFbUNK6+ckYz8tPGDLZwSCmYwIA/GCVxecD+5FsYNkl0hncKbJiG/p3C/
	N6KmXC76D2wX50cQTMBS3NzIVjGXV4HyYlXcK1QhK5t0X3H8BMM3eRrGphBcBv7j
	gKPC+rf/Q8VpSJAgEbHhQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=kroah.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791824495; d=kroah.com;
	mf=PGdyaWZmaW5Aa3JvYWguY29tPg==;
	rt=PGxpbnV4LWxlZHNAdmdlci5rZXJuZWwub3JnPg==;
	s=fm2:rsa-sha256:sGIHS8vjHDlm2lGDQk6oA8vdPkgmCiHQbSU+ggrOWEdZddC
	hyYv16fYtYKF6vblPS15fi75I0vw+BfewrXaklGQBCQaVez+Zuqft7W202mB9Jg0
	Mf6cG6JnVakMfYoJXhlfk8z3to0kHJ4bJdE/Gh5x5kLqRTePPseNkUHLFfGhLCm0
	DriEaSa0huD32ics0GKbDEHQ4aWIQLxscFpf3u7s+zGP4Ln3kXb1RWHZMk2w3LBd
	WG3FDgwitWs1yyCrPzk9ZH4aDbaITDu/ES5yY/DWO+timTALtGfXyLq2HERaEPx4
	aRSQzV4O+RuLIh2Y9UcbuFM0dWBUJNaqqg6CFXQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:QDB58Bof8A87nGS/PNkncYKX2ZCEw6LEYhEwJeP2D6Y=:e+lF8yRHmI1wJ/4EXajqxJyYCSaNnIVAVRA2VsT//1U=;
X-ME-Sender: <xms:bxLNaq2VGQZogufSLhs_Ymtm-oMPSc71kqufxMv4XgVOaqz8wiKYiQ>
    <xme:bxLNamaYx3p_NzVQKAeHvK1ifvh0LqSVQWYKziNDmMj_fySu_pcNUIaeF3l4YUfR9
    EiXF0hCqyoeB4eNvT4CvBuQJkQInpRLVU8hFyi6wvMwlyY23hwD>
X-ME-Received: <xmr:bxLNaqJWZfK52La0_hUnbxDZlHrBABJbCFZT2Q9cZNJiy39Gj9nii7VG6fOgD9SLxEQVa83VRZ1ROpHClJrNvlcyR7DYbHl8hvpM>
X-ME-Proxy-Cause: dmFkZTFOsgINCoh7OPsuSK0zjonm02J6U0D8HTpAc9UFzZkpF7LiFJNRTETJTothRMB0EE
    uzGTWKp8iZzFGz5Ko0Ti9jr9oYPBJpeGfduAnG+EnX1y7IRiUbUl5vS83McLByHp9hM1Qb
    d+2A6soTqEdz9BAAhojJPX3eDVOpRHskWgCt3ZlMlY/AcrhpuILUOIogOzLv4yhP+31JRg
    uFiUrEJ7AadpcSRFdv063nkNKgkQav9zQJIyc1Xv8d0HOg1nN/HLDDXZW4SyXr1JUEHwJt
    F4VNwn3zmezIcn6uo55Sy8M6xc2ak8lcq/BlJ6mGWdQNll8xXZcadG6AXNvyiE12jPyfF1
    5GgBdlGxaTm7MNe1yA3qKw0VU8/q5QvVfshf/VU7WW2y72pcT5aQ0OgbuUhzTX3z5qlpc/
    xpKT8g44kGrCyDAsvZC1tc8Zlf8vmNmgMFQY9HHaO//sVYyuQtNprvGypcLarTVbzJAJsD
    8J++oWxrBLGOH2gs40Foy+30okUwRbLa1qD9KjgqOCCm3qwXubzis4xMnkbQdbY3qt4TK1
    LsfFhDl/8TpW62J8gLVeRtVO5PylLiPCWorBHrq0OSSt9J44adQX+AjQ8RzqE4y73BUBlU
    0ekyrSpJESzOW2FpuzETzcLJo/QDQ3QSZ7t/R4uVW5S7bkrHF+puru9Bquug
X-ME-Proxy: <xmx:bxLNatGNgylB9IfO7GbXeLAWd_BvJwzqXDJhcky2Q_R6yvipWvhwyQ>
    <xmx:bxLNapueIecwwsugq4PbnRFyYlfl_Zeg0CBaQ23gZxk2R0neA6LgZQ>
    <xmx:bxLNakvOgT1KylGlisXhHUppNVuHZHNvuDM3YRG2JSOFzkm1Esh2-w>
    <xmx:bxLNavATBPJeJbQyXMYO4CdupOyJ_HsaJSRsQIzHe9KxNpJsj9ODTA>
    <xmx:bxLNas5ADSWO7X9CcoRV70ulrzNASOr3FD_muZrHsSrOVNGuhUpbbvLg>
Feedback-ID: i1d2843be:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 12 Oct 2026 13:01:34 -0400 (EDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 0/2] Documentation: ABI: leds: Document shared
 trigger attributes
From: Griffin Kroah-Hartman <griffin@kroah.com>
To: Wayne Ho <wayneho219@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin@kroah.com>
In-Reply-To: <20261005-docs-leds-abi-trigger-attrs-v2-0-c5f8970b1b42@gmail.com>
References: <20261005-docs-leds-abi-trigger-attrs-v2-0-c5f8970b1b42@gmail.com>
Date: Mon, 12 Oct 2026 19:01:30 +0200
Message-Id: <179182449016.72416.1137623814317141380.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791824494; l=580;
 i=griffin@kroah.com; s=20260910; h=from:subject:message-id;
 bh=e+lF8yRHmI1wJ/4EXajqxJyYCSaNnIVAVRA2VsT//1U=;
 b=zGJ8Xy7E4npm6j1Q0BrJQaUTJm5icL5eBoUtqW1brvU44/BE4HAz2Yo4g60WLd3mHY448Mwz7
 b99dCnuw+0pA7EFjGJCgL8Tj+p6WiDY4xOuxWY1/Ufk1gK7QvOiwRma
X-Developer-Key: i=griffin@kroah.com; a=ed25519;
 pk=HlyUkuZAN9I5qlPbOHN5N9xxdQ5sT6AbPgC4TsLCxzA=

On Mon, 05 Oct 2026 23:27:45 +0800, Wayne Ho <wayneho219@gmail.com> wrote:
> Documentation: ABI: leds: Document shared trigger attributes
> 
> The delay_on, delay_off and invert attributes are created by several
> LED triggers, but only the oneshot variants are documented. Adding a
> separate ABI file per trigger would make get_abi.py report the same
> sysfs path as defined more than once, so patch 2 moves these entries
> to sysfs-class-led and describes each trigger's behaviour there.
> 
> [...]

Reviewed-by: Griffin Kroah-Hartman <griffin@kroah.com>

-- 
 

