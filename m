Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6535437CC;
	Tue, 22 Sep 2026 13:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790083585; cv=none; b=qmvinxJgqyCV+Sdt3jB1iW4LqhG4Bfrbwhp0yw7VMt8iqJGRI/yU4CWW91vttVN8GGMYMfixE6lkDY0baJkFXUSa0TRcDXkgjrFWBMg55r8P+S8vZGgmwTbGEsaszoc7N/gHJF+YzSDtsxMyph6J/oaxdBND18r/02cQALLIuuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790083585; c=relaxed/simple;
	bh=pNUWb3AoyiA6Hpq0DJBXqdJOudtoWpufkHJ8/D9QsE4=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JT3hOs5c/7joSOrWbTBhpFC1vkwVyHuLRQ9TaQOl5l761Ap2AV1+mDBdZ/oNyRbQ+OGH8uf7RVTeBERvyVZ9MLCo0U//EO8/ja10atQn/m3J62FFagn5S38gqnJPBjruiWjs2nOAq7ALVYAtbwWZxEhubqDn5SqXVbwX582ml58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jhJLro2b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jhJLro2b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E2FE1F000FF;
	Tue, 22 Sep 2026 13:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790083583;
	bh=Kb+YLhKYpCsApgDZcUDNTHImbtvYDH1ik4YXht0NJLI=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=jhJLro2b6mK69X2varWmampkeELkD4GSqLwmD3cU1nf50bCZM0jTZnFKmieUCf/om
	 8aPMmt0jvI98m/4k8J9VzMWSohaLIkPDaE1ggZ6qeYvNisvsxaSsqgGNt6JJUpKpMP
	 8hOYBy32n2c5MBjzT5Cx36sBl1y1lfEBaStgQMRiWAEV5EDB7OZJ9Ejsfbwgg6Dy3A
	 7xHVyo7igQBObKNUYJSJkq4dqvwR5Xa1ERxqNU3hGG+/TjWb4ZI5t3TS5MEsseIlyK
	 nTmdaATNO458bqHSO0QLzqjk/Iz/DX3q5w8i4GPhdYTz7A1Pq2R7EMiuiQLI30N4HT
	 yBuxyGeQr4ppA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, pavel@kernel.org, vicentiu.galanopulo@remote-tech.co.uk, 
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Manuel Fombuena <fombuena@outlook.com>
In-Reply-To: <GV1PR08MB8497668D389D43F680D2CE3CC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497668D389D43F680D2CE3CC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Subject: Re: [PATCH v2 00/13] leds: st1202: Naming cleanups and
 pre-existing fixes
Message-Id: <179008358207.3393151.6105937183709213100.b4-ty@b4>
Date: Tue, 22 Sep 2026 14:26:22 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Tue, 15 Sep 2026 13:40:05 +0100, Manuel Fombuena wrote:
> This series collects the issues identified during review of the two
> previous ST1202 submissions, the pattern engine fix series and the
> hardware-accelerated blink support:
> 
> https://lore.kernel.org/all/GV1PR08MB8497C0B898789BB73ACE6EE3C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com/
> https://lore.kernel.org/all/GV1PR08MB84974C7ACD911E66864C5008C5DA2@GV1PR08MB8497.eurprd08.prod.outlook.com/
> 
> [...]

Applied, thanks!

[01/13] leds: st1202: Correct the name of the prescaler conversion helper
        commit: 226f32543668960673596288a50191052dba3352
[02/13] leds: st1202: Spell out the phase-shift configuration bit
        commit: 7520fc78c52ea55c2c83d0ecc11ab2355a753b7f
[03/13] leds: st1202: Name pattern index variables consistently
        commit: 0aed225f40613253617ad30a57492043a3448938
[04/13] leds: st1202: Use u8 consistently for 8-bit values
        commit: 38f98583bcac95a65774b73cbcc56280a71f5612
[05/13] leds: st1202: Clear unused pattern slots in pattern_set()
        commit: 119a7d375e5caedaf252198fa64e7df5d7269ab4
[06/13] leds: st1202: Scale pattern brightness to the 12-bit PWM range
        commit: 82f8b88d6ac2edf01651bbd84e03ede04b2ca80e
[07/13] leds: st1202: Program the channel current for hardware patterns
        commit: 878eec1475e77ad22059584bc617b6e671a536d9
[08/13] leds: st1202: Take a reference on the LED firmware node
        commit: 5882de94edf7a53812a76a882a95e1e86d7105d9
[09/13] leds: st1202: Do not set brightness from atomic context
        commit: 1ec35fa181981b4b9581b3dae967bac7ed82c89c
[10/13] leds: st1202: Clear unused pattern slots in blink_set()
        commit: 3268b9e91db16f240ffe07ff6caf963ba8191ce8
[11/13] leds: st1202: Honour max_brightness when blinking
        commit: 865d81a98602c828515fa6ac3c530efc4205f9f6
[12/13] leds: st1202: Cap the channel current in st1202_led_set()
        commit: ca81ea108502817e3841e98f0d3651398d9e1bd9
[13/13] leds: st1202: Give the channel current ceiling a single helper
        commit: e264a106d8fc45fd82891cb0c4f8bd9e2c48c152

--
Lee Jones [李琼斯]

