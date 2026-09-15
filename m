Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492943CEB99
	for <linux-leds@vger.kernel.org>; Tue, 15 Sep 2026 02:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789438365; cv=none; b=FX1KiXXiZfcAcYzbo+MN44oDfhjCl7flXB+iI4McGRbteajWv2+OS3Dc5XuVINoUSZXFK4r+zvfl3rEOzy1zxs+cww7oNhX7Z/1qSfSmE7sQEcSME0EJyepL05+vnuVld/fz7cUiamBHdOoPaK8SHu593LLFGOyRWgntkVwnSPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789438365; c=relaxed/simple;
	bh=5HBIfXwVwM2HXB2fLdKXs2f5+UCjZ5vz7oYlnnhTKPw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Vp5V1kBYuXxxM/i5djutYtfXgLx5JJtZwU/3QUKaclQVkWKhx5E02y0uM5117MTrpuO4f2y3h4Ckwq2lDf/Z9B0QNdsPXXI5ROEpKayMNpR25HylkflV53HrSGfjVNFZVY42LBtb1BJEYDOGVFolEeEAdxmQ2S6yGlAmU+hrDus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JKJVHIhG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JKJVHIhG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7D821F000FF;
	Tue, 15 Sep 2026 02:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789438363;
	bh=5HBIfXwVwM2HXB2fLdKXs2f5+UCjZ5vz7oYlnnhTKPw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JKJVHIhGekte/heq5/NEnd1Ex63QmWbhh7JX7G9beEgkjh9jEIi2NmtDsI6RRAKly
	 v3KuHMLyxb/jYpJ0+0BGoIaWBTs6p3UDRe1w3EFV8hXOvbZKnZpd2dDcoHs8KMHHkD
	 2qak+k5r6yj/sgpW6MJIOjxW2uk/A0m36GyUhnRzzu2hW3KqrJjXcOw6ydqPwSXPC8
	 biJCwGWPt+mcAdFM1g7WAx7gV1oGa3pOLSaSW3CZHQi3Ey3FkmQDnAKCRG5UVJHCGE
	 yej8ud4D5KmKeJ3f7YiacegYaRuZv5C4TAekBkLRnFLYZaUf7UnRyzX9OxlrJe25ex
	 CfWVpuQw92Vfg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] leds: blinkm: Remove sysfs group on allocation failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Myeonghun Pak" <mhun512@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260915020600.91955-1-mhun512@gmail.com>
References: <20260915020600.91955-1-mhun512@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 02:12:42 +0000
Message-Id: <20260915021242.B7D821F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> register_multicolor() returns on allocation failure without removing the
> sysfs group created by blinkm_probe(). Remove it on this path, matching
> the helper's existing LED registration error cleanup.
>=20
> This issue was identified during our ongoing static-analysis research
> while reviewing kernel code.
>=20
> Fixes: 56e8c56c9af0 ("leds: Add multicolor support to BlinkM LED driver")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915020600.9195=
5-1-mhun512@gmail.com?part=3D1

