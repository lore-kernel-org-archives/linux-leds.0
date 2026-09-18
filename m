Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536D93B1ED0
	for <linux-leds@vger.kernel.org>; Fri, 18 Sep 2026 14:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789741564; cv=none; b=H8StjG52XenOIiBcS/plhM1gVGbMgsDEr8MBhxP45BS+UyxCZKasAEaS5XeyyDV3J/9e76f6OcVV4ejdGNNRiV+k5bUXCd+9RKLcgybHlVTQlbpoqpxw+44ZjoV7uFvyv7Nv1CH50p72Zmg7AqxRxSF3qJH6NGLIQ9JQeijEG24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789741564; c=relaxed/simple;
	bh=Vt8q5dCr/WCEMo+VcsSJeP2pdP11wG9OLLmGn0qhRv8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XghKbkJHCFQqyqW1Mk//MiqXEr+XQZ0ewWrtgJ5DYl+AWjcbUdouG3BfrU6PlzB2jt5E6hSJM9E/xss+H7j+yzjL2l7cQNE3T09Sezt+qOqHtXE9q9r3L0gy9CiBZEu4Heo5GzS0B/CBy/QfZe5vlJWAsQgodJlKXk+RdX9GK50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BzzEccrV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BzzEccrV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 922E41F000FF;
	Fri, 18 Sep 2026 14:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789741562;
	bh=Vt8q5dCr/WCEMo+VcsSJeP2pdP11wG9OLLmGn0qhRv8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BzzEccrV3KdtW+yYtbVARh6ZsTa7XUJnvl3sagzMBbQkXhUfXxEt2knFFPkkG6p6X
	 l1P+IpgoSEy0NLqWxOM8gWOcROKEyCTJpqQBUxfTsVyptmYKxD3Ozei8EbgbFjw45z
	 kCNR2X/JtCo5ILS1rorXWRW7eYN1FtonkVwaC84UdrXgiCC0Br9sCoOp+Wb4nXvGio
	 ZtmEoYfPzeH+st8wezYfpYU66OW22RzbyRuHJYrOZPFthrdpMtcNNEzS22hTI8tiYk
	 eO2ADmjPaI4NurB2PzUG4tVfb8OI0LV73+UyWgccJriuROOImMZV7eX9uJKcgy343P
	 oopgzAMIAYejQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] leds: use assign_bit() where applicable
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260918141728.3022983-1-peng.fan@oss.nxp.com>
References: <20260918141728.3022983-1-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 14:26:02 +0000
Message-Id: <20260918142602.922E41F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] leds: commit message description is not capitalized
--

commit 4b1968fcc8204102041e265576cd6e2a93a963a3
Author: Peng Fan <peng.fan@nxp.com>

leds: use assign_bit() where applicable

This commit converts open-coded if/else sequences using set_bit and
clear_bit variants to the unified assign_bit API using Coccinelle.

> leds: use assign_bit() where applicable

[Severity: Low]
This isn't a bug, but the commit message description after the
subsystem prefix is not capitalized. According to the LED subsystem
guidelines, it should start with a capital letter.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918141728.3022=
983-1-peng.fan@oss.nxp.com?part=3D1
