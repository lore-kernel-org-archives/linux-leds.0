Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61EFF4D2ED4;
	Thu,  3 Sep 2026 15:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449536; cv=none; b=NpdPHIYFbuS0UC6KTlgqMl3rAcvfqBrUpdmEorTzn3vI24EzYt2yIQ/F0NaHzgKnAlsbLkmrLVZD2HcmSBirC0fZnKGyLT8//j55fKl5lE598iqCU1aKlZcCnw2RRDyMsdSQ4bUUveH98kSYjga5tKvxe9r1Q3f1BaMWBqQprWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449536; c=relaxed/simple;
	bh=XF7bUNnzt79CGrku6gmw+t+PUAzaSeJ+5quYP4m/uto=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DPwwMi8KUSx4HsKCDBe8hgTxp+402ebZQl63Hs9bv0shtefafJj0DvWrUeVKO8/eZj5+E3clJsGUG8Y7H65aDnPUio3rVuAUtrB5hcZZLlyz1ZUi7/i+7Rl9XjFdLOloNJKqRZ0LH4JLXQeEOETxVTs6FAhTCeGHbRMf6kZ91Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f2yi3/Ci; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f2yi3/Ci"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 187B81F000E9;
	Thu,  3 Sep 2026 15:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788449535;
	bh=PJdNOYqNT6R8h0h4Y1Ze3TlenHgvTRcPsif4EXJZV4k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=f2yi3/Ci5EtmBVGSAhyUUeC2Obf8QT8oQrjKfngFKlJrd2y9maEfJ7E6toBccJS88
	 9Zv6DPsVoz883ebQeQBbwUAmMN0Z8rxgvXVHZtJFVrwUwpfdglpNBFQSrjvab+WSvP
	 182/5d04WIIWOcG4TbNmn1VRIVZtuD816zFdKBz3XvQWpkQUMzmQHpVm5PcyR1CoCF
	 OqGzINzoIv77tcZH8grQazuTCniLu2e18nVtU88bz3w9XEmSqPTjCeloXZnZ7oKzdd
	 FUvoGpadovCl9kBLAj4XTOnDdr2DIuyjQqEtjCmeHD4/UlKUZh6moBClOOwz6sr5+M
	 Esuqw7FroZU0Q==
From: Lee Jones <lee@kernel.org>
To: cw00.choi@samsung.com, krzk@kernel.org, lee@kernel.org, 
 pavel@kernel.org, Manush Prajwal <manushprajwal555@gmail.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dsankouski@gmail.com, sakari.ailus@linux.intel.com
In-Reply-To: <6a914e1e.7d702ed2.1273e8.2a52@mx.google.com>
References: <6a914e1e.7d702ed2.1273e8.2a52@mx.google.com>
Subject: Re: (subset) [PATCH v2] leds: max77705: use
 fwnode_for_each_child_node_scoped() in max77705_add_led()
Message-Id: <178844953284.2707959.4455849985872388708.b4-ty@b4>
Date: Thu, 03 Sep 2026 16:32:12 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Fri, 28 Aug 2026 14:30:13 +0530, Manush Prajwal wrote:
> Rework the subled loop in max77705_add_led() around
> fwnode_for_each_child_node_scoped() instead of adding a manual
> fwnode_handle_put(child) before the early return on a
> max77705_parse_subled() failure, so the reference on the current
> child fwnode is released automatically on every exit path from the
> loop. child is never used outside the loop, so the now-unused outer
> child declaration is dropped along with it.
> 
> [...]

Applied, thanks!

[1/1] leds: max77705: use fwnode_for_each_child_node_scoped() in max77705_add_led()
      commit: 4805e5ec50d0b355370e3d1ea906af4fc758accf

--
Lee Jones [李琼斯]

