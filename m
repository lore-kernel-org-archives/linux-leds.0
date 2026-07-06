Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCD83126DF;
	Mon,  6 Jul 2026 07:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783323325; cv=none; b=eCHOriGg5ggTeeLBRUG56aGPspdaFytvEPOQdRWJPSWEk2Bck2Zy2urxnxb+bExgCOF72QS+Z4PzCdh9J1ZsbAjBCZv81hYZeBkHYgfGofnR1uM8pex1nq8J9Uhbv1PJtScvGWnx4xpHrpaF/39BaNXGrOT/XIvsFOLaKrmbRck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783323325; c=relaxed/simple;
	bh=1VKGll8VO7q01/u+rSZ+/ZBVXEteUob5QpHa0DFBAYE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=du7g1QCQdSrPw8BPQ7JtRElW7QP1j56duiJPjpSAPbZ/so21O/Qf9fNeW7UR6JpGY10rPSS6E9W44b/zQry/ByPv4oKeGKlbovUm9WugZ21IjTQZweJVJ5E/aK0KSvHN9wEwz/NI2+UtKvINsW46skSepWFHqEleWO23uVUAJGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h152Xv1c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h152Xv1c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE07E1F00A3A;
	Mon,  6 Jul 2026 07:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783323317;
	bh=1VKGll8VO7q01/u+rSZ+/ZBVXEteUob5QpHa0DFBAYE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=h152Xv1c9JnC7ZCYhL0We4s2tV2ZYo7OBn6zlfHoygP9aMXxe4XWzKsN7bMyys8r0
	 30fI2b7aStcYWwjVLxrLJjNTB4zX2+0v9z+iFyD3mlTFm1HgsGXyJOGLDvaTbICtLP
	 zwlu5xbbdU+oKaG2emZVYZGkst23hdq1wf6izMKItDk4+wdoCw/u3BvrK4jA4xgRHP
	 hv3ZWcVp48dhhqLAb84vDJDAhl9JCBmFaBTU8XEDFgbeBx/SO/lNzAryiejLyAFDt9
	 bYibfj9gWDd9lHiIYnB3glcUMdqEIJsUB/FIQXnjQUaXOTM/YY77h4fvSEYtKBVDql
	 FaztXIHN+JDSA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] MAINTAINERS: update my email address for the AW99706
 backlight driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Junjie Cao" <junjie.cao@linux.dev>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, lee@kernel.org, robh@kernel.org, linux-leds@vger.kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260706073307.1038430-1-junjie.cao@linux.dev>
References: <20260706073307.1038430-1-junjie.cao@linux.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 07:35:16 +0000
Message-Id: <20260706073516.BE07E1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Switch my maintainer entry for the Awinic AW99706 WLED backlight
> driver from my personal Gmail address to junjie.cao@linux.dev.
>=20
> Update both MAINTAINERS and the device-tree binding maintainers field.
>=20
> Signed-off-by: Junjie Cao <junjie.cao@linux.dev>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706073307.1038=
430-1-junjie.cao@linux.dev?part=3D1

