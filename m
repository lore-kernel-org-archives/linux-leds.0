Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64AD4A484E;
	Wed,  2 Sep 2026 15:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788361771; cv=none; b=BSJe0IuZnrBsk3iQBrmiwqov6pwvsSBYTEWVVcNZJO+WGnbyZnEOKRcn5xfC30pbzrsh7/iXQNi3I5RCi+HZ5LVTK8VdGw9fXEoLhnM3UgZbrxu/MIKbp1Qc88sWHBOAziUNAGWsgtHkvfqHFvjZ4DA1Dk57Sf7mDDJd21nXb5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788361771; c=relaxed/simple;
	bh=yOhZ9dEShFp3cFZGVitj7Jhgv4Pock90c99QzhBNNdw=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CeFAd8AiYiDeh6TIDE/bMpkaXAMMyl7fiWMuM0xIN3BO83JJOY6iGIQ+n1HD3+l0ikvryRNP5nxQBalvbb7PDhhME2IVfvpabisSKu4ZN2mG9zFnP3gh3lxPdVqsrGplhuEsU6W9sZxO3EHzervs25UwEKDMwCNi7/wjNpKQd+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h/lISYQC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h/lISYQC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15EB81F000E9;
	Wed,  2 Sep 2026 15:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788361770;
	bh=a4REuSTHu5p1SRUXP4+jtgOAgIHwR6mqYzlVqO8P+Hg=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=h/lISYQCCjS4u6cTcZ8u7G72Q8iyiftG6C1SKF+Xihft6B+Q4HS2WIeHXNPGPVbPw
	 9gT1YrkLD6Zhn+iL/qFL7kXUIMyFC8MKmEVCGkBC5AITOIaapJxZwUB/K3bw4gJimz
	 U1S9JamWC56XMEAgsDAOFq8OoS78a+U5vVso7KoEXfN+18jpbuxOBeT2hl76kyvvh9
	 vRl7dvQK9426eun4XckifvxU3Vwt1by+qESdXj2cQTjaRzFvKYtxuVjbYSHVfO/RQc
	 aoaly1LDn3Olg5AIQGGmONtIWSLSEnjMr/Ma0FTXFsqwe6OKo8B1Z9aMeOtC1GRkO9
	 gKecOT7qXK6Qw==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, pavel@kernel.org, vicentiu.galanopulo@remote-tech.co.uk, 
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Manuel Fombuena <fombuena@outlook.com>
In-Reply-To: <GV1PR08MB84973F79E871176EB387C377C5DA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB84973F79E871176EB387C377C5DA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Subject: Re: (subset) [PATCH v7 1/1] leds: st1202: Add hardware-accelerated
 blink support
Message-Id: <178836176883.2115301.14119761641593603872.b4-ty@b4>
Date: Wed, 02 Sep 2026 16:09:28 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Fri, 14 Aug 2026 10:16:54 +0100, Manuel Fombuena wrote:
> Implement blink_set() to enable hardware-accelerated blinking via the
> timer trigger. The LED1202 pattern engine is used to produce a two-step
> sequence: full brightness for delay_on, off for delay_off, repeating
> indefinitely.
> 
> Requested delays are clamped to the hardware range [22ms, 5610ms] then
> rounded up to the nearest 22ms step. Clamping before rounding prevents
> integer overflow in roundup() for extreme input values; since
> ST1202_MILLIS_PATTERN_DUR_MAX is an exact multiple of
> ST1202_MILLIS_PATTERN_DUR_MIN, rounding a clamped value cannot exceed
> the maximum. A zero delay is replaced with the default of 500ms
> independently for each of delay_on and delay_off.
> 
> [...]

Applied, thanks!

[1/1] leds: st1202: Add hardware-accelerated blink support
      commit: d8328aec54986247fee1586d2a1e85485324709c

--
Lee Jones [李琼斯]

