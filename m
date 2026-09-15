Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865573C417E
	for <linux-leds@vger.kernel.org>; Tue, 15 Sep 2026 12:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476884; cv=none; b=XWhoRrxDUWC1I4X5I8PeHiUmZJn5ai4h+plKD1YiGNz8IkiLi0QZmXF4Grrx2+5OltNa/WyxwqJM6hGIODJgmV1vxYqwFE4W4+i02s5nTeeIEfmESjPlKgglwC2ZMtCzGVyEFSfVXT4QezmQz5o4hfeGhZ5QWNl+M0jC/cHS7CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476884; c=relaxed/simple;
	bh=crVcq1M2gIjTToTEGPOZDsW4GNiLlxkTl76umf67PuE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jf1pbc6wzVAl4GOwcIWxjHvpB6Ksn+Rj0I+1LXN1Z+I2XHjviS7hH8/lOMup3Ma672K4d36e/ZJxhcs9wAJd3hWP9S9VXkFlqmRtRLns6TAq9NQcQiZ8vxqzctFZNiArqm0fLSPNl1gq0HoURatJm0sO/Fg07s8pE5CsT4kNUTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IpY1QEj4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IpY1QEj4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E84321F00893;
	Tue, 15 Sep 2026 12:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789476883;
	bh=crVcq1M2gIjTToTEGPOZDsW4GNiLlxkTl76umf67PuE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IpY1QEj4L072Dz1m5qY0+Gvsm7QrrHNYX2LIV1R7Hd0FU84efummEiFDZlRYTBi4d
	 eabdOluD1CyQzIk/eEiXGearNhwgdFpWQPVMpPrKlv7tJP51mU4JVycFfTiTnSjd74
	 u/ABccCgX8fFZrvuJQu1WHPzPhv1b7qWi+WBkCh0ndh89BfBYlfkLuOBeG0B/Idz6z
	 WOLaJYVeQH3O0hjTq4c5e4ohU3l8jl/aVDyW3OF6rQB9Sgl62Gw7C8efc0a34XFG2Q
	 LG1Rlq29peRDaFIsmdVFVgpPn6QjqcHWm5iWu1J1DuM8RTH1ggbjLlGauTxWW9rQOD
	 Lsdo/Xnt1AsDw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 03/13] leds: st1202: Name pattern index variables
 consistently
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manuel Fombuena" <fombuena@outlook.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <GV1PR08MB8497AD614B8686BBDA654674C5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497668D389D43F680D2CE3CC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
 <GV1PR08MB8497AD614B8686BBDA654674C5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 12:54:42 +0000
Message-Id: <20260915125442.E84321F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> The driver already names pattern indices "pattern" in the signatures of
> st1202_pwm_pattern_write() and st1202_duration_pattern_write(), and
> st1202_blink_set() follows the same convention. The remaining loops
> abbreviate it to "patt", which matches nothing else in the file.
>=20
> Rename those loop variables to "pattern". In st1202_led_pattern_set()
> that name is taken by the array of pattern steps, so rename the
> parameter to "patterns", which also reflects better that it is an array.
>=20
> Two st1202_pwm_pattern_write() calls exceed 100 columns with the longer
> name and are wrapped accordingly.
>=20
> No functional change.
>=20
> Signed-off-by: Manuel Fombuena <fombuena@outlook.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/GV1PR08MB8497668D38=
9D43F680D2CE3CC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com?part=3D3

