Received: from mta1.migadu.com (out-108.mta1.migadu.com [95.215.58.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22AA6376BF1
	for <linux-leds@vger.kernel.org>; Tue,  6 Oct 2026 18:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791312891; cv=none; b=a1s8iH/rSOzWx4IKA6CNgB4BC3bYOaqaxiiduoKTJjUfUJM64OPzMMMV/F1wi35bASUuXSnZh7TFxSHI9ltVwRii/cUws/0TWG557IcrCtasss+eCtKab20uye9PIkAtCTpauJBLBb5HeICcR8pTh/tOmBsMHd7ZUM5ifv0haHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791312891; c=relaxed/simple;
	bh=3bvT2VatBc1K+HvjSMEV9tZwrAHqrBfs03wveSjQq+s=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=Q3nWMJyFTNWDaReU4lt7vI2MD1b7MQHNIxzZcADycvYRgG7CaIOp5u9ov+jJhW2009Kr768A/j/9Ie6fLbi5MIcFNf3dToJXtK/0gcS/PPXJW9XsKlGqxolxuy4p8vIBuwGe0eITxn/INqFXkRlTtyYsu/klNFa8oTaP4ooUbYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=CZFF2oIE; arc=none smtp.client-ip=95.215.58.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="CZFF2oIE"
X-Envelope-To: linux-leds@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=3bvT2VatBc1K+HvjSMEV9tZwrAHqrBfs03wveSjQq+s=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791312887; v=1; x=1791917687;
 b=CZFF2oIE/uE7UGtgOj7S9G2slnguIiVwwB6wQReR5F3HbLwBWqMMHmZ07W/vzuvA1XP81J9t
 V1Aml9HAf9MX1NJvW1Rz+ZwfUuTosp4aI8by+ushB0IDWhubB13wfelLdtQE5f6CWK3An2QHnKK
 XWgeyqLpxB7N059gPwFpXxU3RaaXKthHjSv26nKS8J53quenplPgNTqrwtXu+AHgdgfHVklh152
 fs3IfcCZdRpfA+p9KkHoE51N/bQ8FDuV+1lD6U+mHr6J3RsJvvzBlW8zDYPnSNX3Gme/4+z+pKI
 goW7G0xkFmBbu3gW4wbxkjFmQrqVl7soznR74VzjCI28Q==
X-Envelope-To: linux-leds@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b3cd69ab155009df;
	Tue, 06 Oct 2026 18:54:46 +0000
X-Mizu-Trace-ID: b3cd69ab155009df
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 06 Oct 2026 18:54:46 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Paul Sajna" <sajattack@postmarketos.org>
Message-ID: <8233c4f988d72cd2cc65897dcf2d9e46639ecffd@postmarketos.org>
TLS-Required: No
Subject: Re: [PATCH v2 2/7] leds: aw2013: Rename internal APIs from aw2013 to
 aw20xx
To: "Griffin Kroah-Hartman" <griffin@kroah.com>
Cc: "Lee Jones" <lee@kernel.org>, "Pavel Machek" <pavel@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Nikita Travkin"
 <nikitos.tr@gmail.com>, "Alexey Min" <alexeymin@minlexx.ru>,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
In-Reply-To: <179128353952.5667.14752630401954655843.b4-review@b4>
References: <20261005-aw2013-aw20xx-rename-v2-0-108ecbdf2775@postmarketos.org>
 <20261005-aw2013-aw20xx-rename-v2-2-108ecbdf2775@postmarketos.org>
 <179128353952.5667.14752630401954655843.b4-review@b4>

October 6, 2026 at 3:45 AM, "Griffin Kroah-Hartman" <griffin@kroah.com ma=
ilto:griffin@kroah.com?to=3D%22Griffin%20Kroah-Hartman%22%20%3Cgriffin%40=
kroah.com%3E > wrote:

> I understand the impulse, but the preferred way to handle this situatio=
n
> is just to rename the properties unique to your new driver, otherwise
> this code wouldn't make sense to be in the aw2013.c file anymore :)
>=20
>=20Thanks,
> Griffin
>=20
>=20--
>

Thanks. This is the sort of feedback I was looking for in the RFC, but ne=
ver got directly.=20

I'll=20walk back the renames some more, and look at the fresh batch of Sa=
shiko nits before sending v3.
