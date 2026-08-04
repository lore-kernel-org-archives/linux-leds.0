Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7129C3EDAC9;
	Tue,  4 Aug 2026 20:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785876661; cv=none; b=cyqjaD98YM2ylfIhtaVMQ8OGfdFP8dqdNM0F8aQQWm9xcWDf16JS9bHyFvzqOmVHG/Xwxjj5qpj3Ify2nRn1YAdlY8Y/jaag8eK37C8NaS4XJwftHV+o7SepTi+bP/kj/Jjx2JnkbQEW1LqeDe+AKqheGJxiSXAHIq32LwwZbPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785876661; c=relaxed/simple;
	bh=a/rbtc4L6gEqsdjQDDL21uNmJZDwicfl7EquE6s7Hk8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NMKeDR2bzjxORsLTTbh4Jir8zlXXrqQEiEhhVdTbQPynOpIBLvf2LCnjlHHlwik/SX0Urdlz1ZwZLjby0uZz/gtY2i1wchfTHqeitRe1gh30VHySnKDVF6MlAveQi/bm8J1oNFrpdFSbaWkol1no0lWinDDWkimg5Eecf6nD4hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aOKWhK0A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aOKWhK0A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE9451F00A3D;
	Tue,  4 Aug 2026 20:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785876657;
	bh=a/rbtc4L6gEqsdjQDDL21uNmJZDwicfl7EquE6s7Hk8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aOKWhK0Ad942SOY75Ij6P9zh+G60vp72JyOwXnRI0MSoh+qanfLeWnAp0015MsOir
	 mLnbXCPIQgSgFkIWGrlT9qXmyJB2MMgC1cFUWtmiYGztic48KZdl/HzgF7vG1U9nF/
	 EV3/EtSMUd0Jsu5ao8X7JbJPz68veOVQh4bBjx7u4P4tild234P7wXbiBEY9VMzTL8
	 sMoZoQrqDx196Cypdau+MMYIht5RjlVwXFqf6vijp4txnyfx71dSPqRSpDN9lfdHyq
	 vFKPQVEqbC8TKdgQUjkMIvO7rLjFDpYzwiqp90CHZsNzlG3Qlo+3VahM6L2Dqpx7lC
	 Ec4UpN8OYyTGw==
From: sashiko-bot@kernel.org
Subject: Re: [RFC net-next v2 4/6] ptp: ocp: Validate EEPROM board IDs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ahmad Byagowi" <ahmadexp@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, lee@kernel.org, robh@kernel.org
In-Reply-To: <20260803205011.1249-5-ahmadexp@gmail.com>
References: <20260803205011.1249-1-ahmadexp@gmail.com>
 <20260803205011.1249-5-ahmadexp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 20:50:55 +0000
Message-Id: <20260804205056.BE9451F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> The EEPROM board ID is a fixed 13-byte field. It is stored without room
> for a terminator and passed to devlink as a C string. An erased EEPROM
> therefore exposes 0xff bytes and can make devlink read beyond the field
> while formatting board.id.
>=20
> Reserve a trailing byte, classify erased and malformed contents, and
> publish board.id only when the field contains printable text with valid
> padding. Continue reporting the serial number when the board ID is
> absent.
>=20
> Fixes: 0cfcdd1ebcfe1a9b262f6ad8419580720dc843c4 ("ptp: ocp: add nvmem int=
erface for accessing eeprom")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803205011.1249=
-1-ahmadexp@gmail.com?part=3D4

