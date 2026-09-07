Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20694198A17;
	Mon,  7 Sep 2026 23:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788825176; cv=none; b=kmxoc5+TNlAnVYVTP9jXAAFzQTTZxvld6V/ZOgc213E8zXJN7PqrO8x0I2ycIQRRkObX6ae5xATql4qats65wufWRfwVCffNi8SLFXj5kSxbRi3TtVb9VPLn1Wn/Tk4VBAfVsrBLvc8hqo09jXoBY22FGg5ws4BbU62kYwE4D8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788825176; c=relaxed/simple;
	bh=z9U8AtBgsGlKDWh/xXHqznAlCeQhr0lWvbNw/suDWns=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qd71vwE/inaNPC3y1EuMDRsZhnqQ0z/g9X5fMcFfvD11tILVKy+K06Yozh8YWhvzTu+5zxhSpgkqnwpD3jcY25wVBlpn9qckZTmdvuClb9ksuaGYTK33KDteFYYytdJH5jv7M3SaIXbQZL9uG5AInaH50UtHZcScMKZ2D5dcz7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VW/PKzdC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VW/PKzdC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A8A31F00A3A;
	Mon,  7 Sep 2026 23:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788825174;
	bh=z9U8AtBgsGlKDWh/xXHqznAlCeQhr0lWvbNw/suDWns=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VW/PKzdC8BsmBM3HxE/I3nsP+oETWhATJg+NTpvi9myF+2nyfF12ZBnwWi+SDbpla
	 gjokmu1yQ3NEOT7lURNbljaf14jezv3cwaYS204AjP4jeTv6BgjMbPxO0EVVp1sUhM
	 lXGSnEAnkbQFkz+ievKJL5hp2yk4kXjNlFQkhXcQ8UdnirPpOpolQ/UV/GRnV9zlVR
	 cjA4tuWoZlAAXdNlUPvoQlzwRR4njAhQlChlqRfP5qdPM4y3VmtOl9447yucLbbIX1
	 WrEUQb8H/sUrDwLnvOnMqcDislzPyDjaIb6tUxNTwuCI2/sjGGfOTP7gzBQdEmQ44K
	 Aj6AHgHzKimFA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 1/3] dt-bindings: leds: aw2013: Add aw2027
 compatible and rename to aw20xx
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Sajna" <sajattack@postmarketos.org>
Cc: conor+dt@kernel.org, linux-leds@vger.kernel.org, lee@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260907-aw2013-aw20xx-rename-v1-1-c9a7df12a701@postmarketos.org>
References: <20260907-aw2013-aw20xx-rename-v1-0-c9a7df12a701@postmarketos.org>
 <20260907-aw2013-aw20xx-rename-v1-1-c9a7df12a701@postmarketos.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 23:52:53 +0000
Message-Id: <20260907235254.5A8A31F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Document the awinic,aw2027, which is very similar to aw2013.
> Rename the driver to support all of the 20xx series.
>=20
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907-aw2013-aw2=
0xx-rename-v1-0-c9a7df12a701@postmarketos.org?part=3D1

