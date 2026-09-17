Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37AE4B4037
	for <linux-leds@vger.kernel.org>; Thu, 17 Sep 2026 09:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789638181; cv=none; b=DJt/25MlIfyVzLDfP9Bp4UNndKAFPxw9edK6Qupch7+9l2U+uDYMzvZKTW63TANTKEAr3pMRLrVq1O85nlGf8F6Lx0kiYFckp7ubXlwX1TjxpPFdKdHwlQu/bo0RCRmSPM70k8aqZYYltKlYyfdyMvm7iOnIaNy3BCsHMfnzadA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789638181; c=relaxed/simple;
	bh=8UT+CzFFCZJJA20OBt+m7BIrnRkAwWp3Mo6YqUYUny4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ub9xxbW7Lv08viWzURtvGCdRxy57ZTs6RizZuJK0bDW78QAtaugl7YsZvv/zSE7r2F9Bai0/kGaPihWNl8mtEJka8hdo7+9NQ3dYuZ4L5Xii48tZLLHqUemMTyBdgw8A9sSzabwPrVcgT41m+0TDMNlXbk9sU+DbQR2ExWfUGj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mrKxHnw9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mrKxHnw9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80E7A1F000FF;
	Thu, 17 Sep 2026 09:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789638144;
	bh=hOuI7uXoB3Si+65+OozQBhTAddgRwSXOCPLxEhppD/Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mrKxHnw9FJs+KCmDYRfESGWB06OUW+iGYgLqxouGGlJKrwx5a2olcWbE5FVUPJ3Z0
	 aauv2UcmroXytZCauurfDlPHS8gF3z1WJN9PeUkRhTteaLT+aJY1pqAZQehc7sFswF
	 i1C8QiEJYG7eNyfMAlpouJAJlGshysPRmZIWebAOu0ILrStpiDeyEZX7dIfPGhzBqc
	 3MQZBJ/T0Oj/MpiMiDGzVcHC92IQ2x8GAbxr9Qwr9CmUmE9eRtpCAcpCeAtay4A6Ed
	 dGRraZTDWbuzxzJO0dTExeuoagfQKJDh5dJXLXhj5ExAaE6OvbmbPDsMvN0qyTQ6hV
	 GutsQkf/nCV0w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] leds: netxbig: Fix platform device reference leak on
 successful probe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wentao Liang" <vulab@iscas.ac.cn>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260917093641.2144866-1-vulab@iscas.ac.cn>
References: <20260917093641.2144866-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 09:42:24 +0000
Message-Id: <20260917094224.80E7A1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> of_find_device_by_node() returns the GPIO extension device with an
> elevated reference count.  The error paths release it through the
> put_device label, but the success path returns directly, so the
> reference is leaked whenever the LED driver probes successfully.
>=20
> Let the success path fall through to the put_device label.
>=20
> Fixes: 9af512e81964 ("leds: netxbig: Convert to use GPIO descriptors")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917093641.2144=
866-1-vulab@iscas.ac.cn?part=3D1

