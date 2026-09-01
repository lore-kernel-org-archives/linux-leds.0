Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5491A481FAB;
	Tue,  1 Sep 2026 17:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788282539; cv=none; b=EwCLGPEW89/9TpyYN9L3vfpAAE4jWTSy/sajjUNkNg7+dth+eFm4TDXsj6f09Ujv/2pYDlaR//cXWJKg80H8DqiDZkO11R4secSE9349fbHBQLIGGVjOfE6PnXI8kvoPmL8VwbVJ484ilrN+svFORs5NPyAI7gSGr/zwn2nTe8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788282539; c=relaxed/simple;
	bh=hSSTJhLqFu8kBVE3CLhA/oS1COukYxZC796qZI18w/c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=izOV1PFBkClQg0dOAYzKTUTjwNwAngOPJEt1Z2bNaXfCG59sfmlSTXOWiU1UfE0DiMydr7msW9SXL3BWaKusdkyDMwiPFWUV1h3VYhz84kMDP9RQK+x4i5F5bnHFhoZnfGtn6uGDGMBCDxfU8rYT7RnNLw0anpSbt/0+N0JW+7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VM23hWaL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VM23hWaL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 687631F000E9;
	Tue,  1 Sep 2026 17:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788282537;
	bh=hSSTJhLqFu8kBVE3CLhA/oS1COukYxZC796qZI18w/c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VM23hWaLDzolSlNdV2y6nO5FwYIEqCAEXgO4kCbVaYOmc2A59ltd3D9hvfuBI6Opw
	 KLB7NO178tlKQuhHkZ2V0P1a8VLMwve4f9HRnKL0UvnR3S6kRcpXpPxjL3F/Ryrk4+
	 qUKM91qfPKaTmUiczAD+/x3OiMX/iUL3rxNFtlA/OEipn4eTvm47NeGHrI2aub5eVq
	 neNj8h108whv2RmCgqK9SjFrrRkhRAKDCP2+60UK6Zu7LB+G9us5TkwlIMRzAZ//Af
	 cs3+cRz68dWarE/TTVwM5tkE2/MSeKkC2np63o7q7lA1yZtu8X0X2hA3TGn2KWHDVy
	 AlixsNmHg51Ew==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] dt-bindings: leds: lacie,netxbig-leds: Convert to DT
 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Udaya Kiran Challa" <challauday369@gmail.com>
Cc: conor+dt@kernel.org, lee@kernel.org, linux-leds@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260901170358.176103-1-challauday369@gmail.com>
References: <20260901170358.176103-1-challauday369@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 17:08:56 +0000
Message-Id: <20260901170857.687631F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Convert lacie,netxbig-leds devicetree binding from legacy
> text format to DT schema.
>=20
> Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901170358.1761=
03-1-challauday369@gmail.com?part=3D1

