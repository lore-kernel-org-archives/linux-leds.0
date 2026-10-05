Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04271477285
	for <linux-leds@vger.kernel.org>; Mon,  5 Oct 2026 10:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791196993; cv=none; b=MRMngkIlGGUgGRMliH8gLjNhmE3285Vkoc1AlLPo/zm/SJu2OXnePar0arTAulRQNZ0iyX8vNRVJcJcOsylDQBbm1mocyJXDJgmmPQXgJD7cyt6xA+2Qtt6zkabxUxh5pruwF/I5jZLoCPaicWi79GsdzIQq2hy9iYrtvIpHUIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791196993; c=relaxed/simple;
	bh=Bn6oPg2w8ZKrRi+o7oENZgvxPZbBCet0rPXr5hVG/L0=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=i9ZcEK8h84cUPkmko5GU+0+ND1lvH4W5KTTQ+V+c132vqrl9WryTfDdQ6/QMx7aNNwtdPQ8ztO38+8hHeNCNokXalRQ8LtTuq/qhmfCmGrB+uylKw4qO5tBY+PdUVQa+vAnLaVW1lSb9wKAYQ3dRPLadmZ1Z77UgvQtXwyWn+V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=jA1vgCX0; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=U7sAsgrA; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="jA1vgCX0";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="U7sAsgrA"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 4C4C27A0035
	for <linux-leds@vger.kernel.org>; Mon,  5 Oct 2026 06:43:11 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Mon, 05 Oct 2026 06:43:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1791196990;
	 x=1791283390; bh=h64JS2eiCKhOsTcQ5TmWniQe3LI5Tmhk0rXb8wPu1JI=; b=
	jA1vgCX0YoS/fV9cjc5AgPtPuCn2ntcUrfEgVmLxDrYkOiWwV1dJhRn/gjFwMFgV
	722j8CQomPs3PveKoOTrD4+8URvTjmtSo7wWnw62ztX+9UZA1xQ/SRAzX+Kv3bC/
	eLAUUN9DOI2742OpetRSjl5ol763juqPS8d20drO+fKX/+MVFDdZZ9iLJTH921fc
	Z4edTlVv29hSzlA53/PFThS3tSxuU3HQN/ETpramnVJ65U5I7MhASKkb0o820QCl
	Z4YSa62WJAW/oujwQahE0xM8jQwHOjwi+Tw1ycs9xW1WrjNb+1qL+ARKBnGQzwar
	KpgUZqnBv1t7M0tHJh1Bzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1791196990; x=
	1791283390; bh=h64JS2eiCKhOsTcQ5TmWniQe3LI5Tmhk0rXb8wPu1JI=; b=U
	7sAsgrAciTfXyDNGqrQHE3N9KMHyiXQm2xf9B9nNREPfIkKXgEwyzBtvpnknpRex
	DlaKsdHzkf9uONjFDJhnovO89lDSE5IjW8BiLGH88zscV/h5u62UXvnJIw72fiFL
	5HH0BrXkEkk/Y22JCctEdn2hVt69TT5qnMHC6iaMbAqgAKv5MxGYTiLF668a9+v+
	ZScl6/QZKDsmZDVW7iDLxuvjoyUB3NNj6MEUkhImutb9N449i+zg0Li6KbeT5m0j
	5hgbDQh6csj7UOzXdIvtu5O83TfCy0S5EIYgXzeGCZVgsK4kMSKKGIXn9aV5kybc
	aJ+u57biIjUf1qH4vxIWA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=sign d=kroah.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791196990; d=kroah.com;
	mf=PGdyaWZmaW5Aa3JvYWguY29tPg==;
	rt=PGxpbnV4LWxlZHNAdmdlci5rZXJuZWwub3JnPg==;
	s=fm2:rsa-sha256:fakygwOH5C8VQ2QegsUG1UuXr/l8q3Dnn9nBey4FZW74+rf
	zvayk7vYtOx3tKxK0ZzN+4ECZSTQAUI4zTLkxiAJ1JngfceyiUJeFkyRRLMeFRVh
	JGnBK9pnAco11xfE1OervwK41wM03iSvydySQeN+n1XitN/H3Y8EEIQP9hl4Gt1r
	GSi1GIpGEz1KEBkBpccrrYddI5HNFtsdhfatCUBWrw3gNWeJAlcaQFgM+PLZQtgw
	OF/1q5iWhB0Wyt2+tqmNrWQCjo3+wYyq9jk+0vtdu0Iv2WlxlNAqoUlrBVeAs/J5
	OCRzlZfFjCR2sLm/d6/rPcwZnmSNyfwlEG/e2bw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:lZ9SuZilP8eJauHH766zIsTOxaAfJBZZratPhTC2cSA=:Bn6oPg2w8ZKrRi+o7oENZgvxPZbBCet0rPXr5hVG/L0=;
X-ME-Sender: <xms:Pn_Dam0Oi50W5_iYER8tdpxqpMIEDQL9D_9OIqCtXRFnDrc_yf0nPg>
    <xme:Pn_Daqk8SFs3qNbgwoY1jzJhHWj1fwQV-4UdsNSUOL1b-PnM_EdRmUXNwDTwlIGfI
    h82r6yWeILYgRc80LuL4fQeVw_48AjE-5TMs03nwIKtFZ7xKHo6>
X-ME-Received: <xmr:Pn_Dau9mI3MB4FIiGQ_VMb3tU0LKyGnIl5TG4a9y8aKDtS6isRUzU31CGPJLNYfTI2l9NvfNg5LYt5aCzZ9p5nY>
X-ME-Proxy-Cause: dmFkZTE7mjkfJoHrgIdp7nYFIk0dkBTiRlgJTkkavtq5LqJ9BdmpzxrjglHqKjyP+ZH2vn
    7k7VW5+zMBpSgwarYyAlUu7ogYCdWzJBqoSuxsglgg9bZdwpsFB9re3OMRB47ojLnUj7Yh
    +Q2XtSFSUn6Q6/8avW19X/jnDT2/xjCQcJyvQX9Q8Xf+eeC6vj5dFrhRMKtvjLB3b8NL2b
    vn3NSR4+RL+LqsgqQXOYhECawVuPqWtAIyG/z+FzkS8G7iftCjwxkKCsGwoRj9tKYEPvnh
    Oi3fd/saK0PpcYu/txavwTJe9ZQRyJUqd4+MLhEyRj9LNXUbyZbU317NjgTAWwHeAbn6VH
    FY9LTpfpwJcGUjAwQlnc7huP0nFknq8ARB3YJ8qqzF/5UUYUVlR1UuQNNJXUthDKKRJP8+
    y9kC3hWb2zOpFQHELmiiT8M+UAHYHoCYxgRHNZRX2/xYHnfalQRpY6kHwetKp/SAyX7QyS
    YLczEgZHyzU/7n4LdQIGm3RWJbrA00pDal/u7iOa8mttekQyUwzyjPVl0y0fBKrVpr+zxO
    +8HmhrFZdpdk+XCvyXTlPkiuycWM++3y3itORIF43YKJYKzqYuGILpiP+U3G8PJDl9amdx
    eElP7TcrY/hdmRHXnKc194fyUGMW66oDbudx0jT0GZmDrxPIkrdxFS60V3KQ
X-ME-Proxy: <xmx:Pn_Danrn3f7C4FwzRXryzAxnQf_RIyM-OPSkEm2VIRP56LQrAt_NIA>
    <xmx:Pn_DavlyJGmf8DC3nWPeA8lCGo-RRSJhW_5Uh4YWeqzzgmtViJm8RA>
    <xmx:Pn_DamjrzWZuxPAleH91mnziF1yIvH4gdbusFTf5-IsQSPcSGjHD7A>
    <xmx:Pn_DavcF0EOdkIZyDU4LQfZUJgKB7WGmQH_LuLHnQ2hm3HoRNhUeEQ>
    <xmx:Pn_DahF4EH1UtWDe6bItvrseqW0lwcpIzb7de15P_ZnGAOz3XEJ_otYI>
Feedback-ID: i1d2843be:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 5 Oct 2026 06:43:09 -0400 (EDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/2] Documentation: ABI: leds: inverted is specific to
 the backlight trigger
From: Griffin Kroah-Hartman <griffin@kroah.com>
To: Wayne Ho <wayneho219@gmail.com>
Cc: Pavel Machek <pavel@kernel.org>, Lee Jones <lee@kernel.org>, 
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261001-docs-leds-abi-trigger-attrs-v1-1-54f0529bf0f6@gmail.com>
References: <20261001-docs-leds-abi-trigger-attrs-v1-0-54f0529bf0f6@gmail.com>
 <20261001-docs-leds-abi-trigger-attrs-v1-1-54f0529bf0f6@gmail.com>
Date: Mon, 05 Oct 2026 12:43:01 +0200
Message-Id: <179119698191.10341.17981065372386761527.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791196989; l=453;
 i=griffin@kroah.com; s=20260910; h=from:subject:message-id;
 bh=Bn6oPg2w8ZKrRi+o7oENZgvxPZbBCet0rPXr5hVG/L0=;
 b=glKyEvVFtFrM32CncmX3Ajjypxtn5uNlZn0lyhV/c0OHDAUckrxmiVjHBlwMzdPENL7x0cfIS
 67uYE1SsLHfAvZsDQQghA6mDqqQ4g/DKEvuQXkyFI6NKNqYfBr5aPyi
X-Developer-Key: i=griffin@kroah.com; a=ed25519;
 pk=HlyUkuZAN9I5qlPbOHN5N9xxdQ5sT6AbPgC4TsLCxzA=

On Thu, 01 Oct 2026 14:45:11 +0800, Wayne Ho <wayneho219@gmail.com> wrote:
> The description of the inverted attribute says it is specific to the
> gpio and backlight triggers, but the gpio trigger no longer creates it;
> it only provides desired_brightness. Only the backlight trigger creates
> the inverted attribute today.
> 

What commit changed this? Should there be a fixes tag?

Thanks

-- 
Griffin Kroah-Hartman <griffin@kroah.com>
