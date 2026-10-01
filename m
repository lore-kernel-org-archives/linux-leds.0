Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B1B31D72E
	for <linux-leds@vger.kernel.org>; Thu,  1 Oct 2026 04:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790830348; cv=none; b=VNvA1vGhXuCGRj8UuI0cZ6J0RWNJN4dxqgNQhT3wKzOnHbHC7x8KUECMzzVqRUQTvhFRwU601TdZ32n3OOUZ8Z8h1VwVEmdJ6p7rUytgN3qS/jAgqad3y/XzqCwrYvoLLflNP/10w0KCNmrobLVjna8trcXzMtIV+m4/SfrjTVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790830348; c=relaxed/simple;
	bh=QgPbd4aRB23PJNsTGwZYumk7sXyAb4iHjfV4qqqpnhM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Sc/UW1YtPgVYQ5aVaeMiALG4ARUWbZPnzftx3Ub3XbFsjDx9lW2ZYzGXgLTlsgoaod7wvJsM2trEekbq2DMD0zOvp0FSBqEOEPbJN5RitZlHTAZDeI6Hsf3quefUxxaaojA/lQSIYsOPp2L7Cf0E7wzQ6kNOBCGJh/D9bNn9b0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HbT7z0js; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HbT7z0js"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32DED1F000FF;
	Thu,  1 Oct 2026 04:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790830347;
	bh=QgPbd4aRB23PJNsTGwZYumk7sXyAb4iHjfV4qqqpnhM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HbT7z0jsWHZHVk2qWRGZvRJnYOQFOVdCwzQRarPqiXPmlrO7fDXXwOsmupbivCnaM
	 GH8FfBITy99y4NMz8MhbAV4k+1GjnKBno1+Dap9SkBLkXDOlACfUfoFELc1guhx/nd
	 /DyivpaNiUUYS2gcks+xjSBjA55ADap4Rpk9EdwbdYpij4BmedCo+/3HoTkuSrl0fC
	 +acrF0WvbRJPotiX4Wxv8pSmBruuUgtZBWI1ImRY1BDgnK+X/u1YEaKaYpa1pY5Ypp
	 vNYlpjYX18vgz+CEBm8KRYry6QyAXvxNDD7dyMYAwVSA0k8qHHBeG5LrXZgHF5NSO1
	 qlIOrYT8l6+5Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] leds: lp50xx: use scoped loop to fix fwnode reference
 leak in lp50xx_probe_dt()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manush Prajwal" <manushprajwal555@gmail.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <6abde533.1f5d5c08.1fd03.f4e7@mx.google.com>
References: <6abde533.1f5d5c08.1fd03.f4e7@mx.google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 04:52:26 +0000
Message-Id: <20261001045227.32DED1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] leds: commit message description is not capitalized
--

commit 0f74bc379bcec72de3189968214e524ff15885d0
Author: Manush Prajwal <manushprajwal555@gmail.com>

leds: lp50xx: use scoped loop to fix fwnode reference leak in lp50xx_probe_=
dt()

This commit fixes an fwnode reference leak in lp50xx_probe_dt() by using
fwnode_for_each_child_node_scoped(). This automatically handles reference
counting for the child node across all exit paths, eliminating the need for
manual cleanup on failure.

> leds: lp50xx: use scoped loop to fix fwnode reference leak in lp50xx_prob=
e_dt()

[Severity: Low]
This isn't a bug, but does the commit subject violate the subsystem's naming
conventions? The LED subsystem guidelines require the description following=
=20
the prefix to be capitalized (e.g., "leds: lp50xx: Use scoped loop...").

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/6abde533.1f5d5c08.1=
fd03.f4e7@mx.google.com?part=3D1
