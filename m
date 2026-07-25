Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9F029B200
	for <linux-leds@vger.kernel.org>; Sat, 25 Jul 2026 08:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784967549; cv=none; b=qx3V0Etqp63/g0v+PAwQo0PqFYMxt9tfuE8sULSCp5e+xC9RY6zHso0tQ4NfUSlhdNdpBBFNi0PuM2B8Z6l/0bKxAb+gMIuBGzKvySTUq2Eeez30ptqb/1NH/YODVHLYfI2WjbtKa5cksyYY4o/LaUsAtQUu/m7oQyzdy35UXRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784967549; c=relaxed/simple;
	bh=LeX9Dsh5oIv3h+yMofUVjvDjqKkvlWvKNDILFUmXyxY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=D7iLcr+VOtbbUKf8g0KzXVX9OzN/JI8vJssgawZBcmo4iOHsntOMAunNEWseLBiaa2GNWM+rj6TN8dSJlfCH+f4bYXmVJ1vgWtKMMFfEO4yClLs4W7nDpbNq2yEe8JzXpnHGI97sed1AgaUqVkgjvQe7j8Hh4HKie2F+j8cITqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PhuDXVea; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PhuDXVea"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7600A1F000E9;
	Sat, 25 Jul 2026 08:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784967547;
	bh=LeX9Dsh5oIv3h+yMofUVjvDjqKkvlWvKNDILFUmXyxY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PhuDXVeaj+z/Yhtmw+ZD9CdwXJ2DnIcmpYcx3nA4GYZN7L/1J2BdIOU0tDz+NPrU7
	 VIrvhw0ja9LtIivLN9HFeoLNL9/ThGFcJw1OmYlNS4yTtebYyoDuAU3fg1Y3cgDAka
	 Y4KLcAS1v/deh8Bu82vmbeRSIBt/JlWA6bEv+8vLXusTqzp6nhzW21ecp9+XQBq0gs
	 cldbLMYmIF6UIA3ggE7oWpf+MznBn6PKqN+EkMfHFm7nbffxBmW6inBb23avpdJoys
	 5M68XHiPVlYamhUHG43fZTwJspLS2CVetEbm2ODjbFjkQRuExpuRPrdvo7oGMLdDBM
	 W+ZeiPRkcRBEA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/4] leds: 88pm860x: Convert to dev_err_probe()
Reply-To: sashiko-reviews@lists.linux.dev
To: Arunachalam <arun07172003@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260725081349.8556-4-arun07172003@gmail.com>
References: <20260725081349.8556-1-arun07172003@gmail.com>
 <20260725081349.8556-4-arun07172003@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 25 Jul 2026 08:19:06 +0000
Message-Id: <20260725081907.7600A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Replace open-coded dev_err() + return patterns with dev_err_probe(),
> which also handles -EPROBE_DEFER correctly.
>=20
> Signed-off-by: Arunachalam <arun07172003@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260725081349.8556=
-1-arun07172003@gmail.com?part=3D4

