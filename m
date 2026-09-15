Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0DAE3B14B2
	for <linux-leds@vger.kernel.org>; Tue, 15 Sep 2026 13:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789477299; cv=none; b=AFV89aacUEe4DnsH11YIM5R0IwBxt9niA/lRwOyTIIvwXoTCBWF8ibT2gnzbnxi45AHWSGU0gxVFSs2udiAkAn06+BoGw9P/JkDjvx1sObH757KfShMXkOblBJBavn39W8HFcTF/o0OdmIk5mMPJf92R4n6Zdm6W4Buq28kMgRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789477299; c=relaxed/simple;
	bh=nTsK6irQMFY/3LXqaSg9dKklssamH6fuci7/h6Fg0xY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LXRyEw/wzHSwfRfXAUHH8K3RET8uDMuN1DVmzfYogzNtKlaBEAlrQJCnD0HrM1x0ffJqtR6avt8QLAHSZg0mkedMlHjhaxJkzMcIlfjTOXt9G6aP5d7qk0cKzxw0vvWhq/c+bv5GW6Mh7f4BGG57kZ8zaRL/vpd3/ihA6dLP3SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dZOnwrX6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dZOnwrX6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 577931F000FF;
	Tue, 15 Sep 2026 13:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789477297;
	bh=nTsK6irQMFY/3LXqaSg9dKklssamH6fuci7/h6Fg0xY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dZOnwrX6rcfBtVFdJxuZ9floEobnKR+2y+T4KCk8eqjQRz3HbDRo0Zh6iiYLYmVX0
	 OjEs2nt3hbvmAtUBEpA5qh8ftOxWGKBZJnHuafEyJIsC0SpxdsdxMQAWrSeilIINN4
	 Pbt6QPMjqaLNoGsOb++QufyWwFoJ2bIMPiKoDPQ01UegJ9IA1ZesmY66hG/qv1H9jq
	 4fNYE4+HDYRqNFL6bdbr77xMuO58m4RyOh0IaaW9M1pwLVF+lynANGFz3q5BOvqidj
	 e3BOeW5r55m8VnZRPsB9r7Dl06GIDYZHVeEbFQ9l2y5+Ntx5ELAOJIA90wUeYq+qsI
	 D2w0+Xf3sId8Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 11/13] leds: st1202: Honour max_brightness when
 blinking
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manuel Fombuena" <fombuena@outlook.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <GV1PR08MB84979A5D536C71D319A06808C5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497668D389D43F680D2CE3CC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
 <GV1PR08MB84979A5D536C71D319A06808C5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 13:01:36 +0000
Message-Id: <20260915130137.577931F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> st1202_blink_set() drives the channel current register to U8_MAX, the
> full scale of the part, regardless of the ceiling the board declared.
> led_classdev_register_ext() takes max_brightness from the device tree
> max-brightness property. The driver does not implement led-max-microamp,
> so that is the only way a board can ask for less than 20 mA.
>=20
> The brightness and pattern paths both respect it. Blinking is the one
> that does not, so a board that declares a lower ceiling holds it until
> something enables the timer trigger.
>=20
> Program the same value the other paths use, capped at the width of the
> current register so an out of range property cannot wrap it to zero.
>=20
> Fixes: 35cbd34a6a05 ("leds: st1202: Add hardware-accelerated blink suppor=
t")
> Signed-off-by: Manuel Fombuena <fombuena@outlook.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/GV1PR08MB8497668D38=
9D43F680D2CE3CC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com?part=3D11

