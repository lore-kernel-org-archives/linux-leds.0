Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E201525B0AB;
	Sat, 11 Jul 2026 19:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783798254; cv=none; b=o5DhE62J1L5lRK+T+GNwgBH/Snoe2mLmHy4DEO/9vhV5rptfClMQgGPmKqzU/Sd1mvRS0YQJB74KGG/X0Kylzv3/z3/CQ+0sD6E7B3a0t4KXYDiUZA4UF3NOxOxnbq1+yDUHQjRlLVcPxqmjRiuKTI+RiC5jq2ZK471snN+c/hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783798254; c=relaxed/simple;
	bh=RVYrXz7x74ud5hhffFxKrHN4BI9QSLcp4hmdZ0FjQpk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qqAJ+VHUg9sulsrfSttkXrD67twEGR1R38cOmXY41OSe07hEkP097lLe0Y/3A0L7yun64GaBBNzpje9QaRYvv6ZIWDCFjOSdT6fyElibvwKDEcYp2nckGxHcJQLVRU9V0mYThzJT6IT+qR9Bqm2bnufCLrO4UOriahItH+hvXrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aDpXXGft; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aDpXXGft"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 313B21F000E9;
	Sat, 11 Jul 2026 19:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783798252;
	bh=RVYrXz7x74ud5hhffFxKrHN4BI9QSLcp4hmdZ0FjQpk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aDpXXGft/BP4l1bUT86g7HHE5J/Bs+1EwtyhdUV8khdrjyktqiR0n0j1WoCCBgXJx
	 Xrzt+U5CaNrKOpI1jmb8y7/Ygw+lWapN9Gm1RxnbaMsmhxLSBsCI3pDKSXGJXpQCOT
	 O9PbCAwVMKew/VAZfF4BaYgKOGLJmfJeeFhrN4GPmqfk7o//rSy5AnNjOF6nNcAh11
	 aAaBVDdYjIUuxaRNUfn3B0OJDUjXmbNmklhlrjKRqzMS6bDJcsZRIEoAw8yi2wKsie
	 oO9j6094myAykC8MHzmEMp6VH4fz5B2VJv7x/8SOhFtw6oVwwdJExrrEfr8GlIBPlV
	 Dt4kMIhVtY/jQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: arm: rockchip: Add LincStation E1
Reply-To: sashiko-reviews@lists.linux.dev
To: "Samuel Holland" <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, lee@kernel.org, linux-leds@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260711192842.845048-4-samuel@sholland.org>
References: <20260711192842.845048-1-samuel@sholland.org>
 <20260711192842.845048-4-samuel@sholland.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 11 Jul 2026 19:30:51 +0000
Message-Id: <20260711193052.313B21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> LincStation E1 is an entry-level NAS device powered by the RK3568B2 SoC
> with two 3.5" HDD slots and two m.2 2280 slots for SSDs. It is marketed
> under the LincPlus[1] brand, but the OEM appears to be Techvision
> Intelligent Technology Co., Ltd[2]. The OEM model number is TVD8322R,
> which is referenced by the vendor devicetree, a sticker on the board,
> and a design patent (CN309443154S) matching the system chassis.
>=20
> Link: https://www.lincplustech.com/products/lincstation-e1-network-attach=
ed-storage.html [1]
> Link: https://cn.techvision.com.cn [2]
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260711192842.8450=
48-1-samuel@sholland.org?part=3D3

