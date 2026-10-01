Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3EA488757
	for <linux-leds@vger.kernel.org>; Thu,  1 Oct 2026 06:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790837312; cv=none; b=BlYITDJ7SMFkTl3bsXgGu3l5pN5I0QuaBPsDCUkfeuRocAP9wrOlvjMZSO1jJAbmXt2r4+IgpN30lmr7KeDYuxoVHO9C5wfHozyoUkavI698UvdPJzx3kQWBw0gvjF81QNwvyEw9/oUfuc5sOsIoqww7Mtry4p2JYV3aYlOPOdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790837312; c=relaxed/simple;
	bh=ozg1TUfGK2RFSo2ZXeveTRwK0n5JiEsmXx1D1d/0oBU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MFOW8NT6gvRkXlCwHlfDqBRF1yLr8wZU6PuAvLUq/gyc9/HfBwXeIdihczrTFMYel5SDveGTRBbVcwjR37sIw8/n52y4VvbZSWOkUN3SAqfiX5/TiSNBT1+OTZ4koIwv611yi3wks+yYKWgENA7cIapT3gIVNqZcU6DWESY1RHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PCXqdvfA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PCXqdvfA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1113A1F0089A;
	Thu,  1 Oct 2026 06:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790837305;
	bh=ozg1TUfGK2RFSo2ZXeveTRwK0n5JiEsmXx1D1d/0oBU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PCXqdvfAVEe3oOmhnMcWN15lOwwJDa5Na0Vr4VDQZA9IZv8qMxC/RGJI76SsTFjTw
	 8N6z6MiF8I3oewakGqOqlJzjwcez+1vRm59O240/Pf1VasZb2iKa8LIF0YQ0zNs2nl
	 XadSTp5N3jKFFlTL0TEfJ+mjZ/PcUMTC9t6ZXhe4XZzEn+mGBm7IYmqKGzAgGHavDJ
	 evxNsbfFj9YhVOXM3o/sgML05sQS0Pu3EU4pyGvsaDn6dIefYlSRL9boyYbnSXfVwP
	 fmqAnumDugdxTf4TMkZjUs2wFHyZZtm5mjrpbHoSQHpkW5sw8J1lOp9peb38Q2sgju
	 9iegPySGlaLYg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] Documentation: ABI: leds: inverted is specific to
 the backlight trigger
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wayne Ho" <wayneho219@gmail.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20261001-docs-leds-abi-trigger-attrs-v1-1-54f0529bf0f6@gmail.com>
References: <20261001-docs-leds-abi-trigger-attrs-v1-0-54f0529bf0f6@gmail.com>
 <20261001-docs-leds-abi-trigger-attrs-v1-1-54f0529bf0f6@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 06:48:24 +0000
Message-Id: <20261001064825.1113A1F0089A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] leds: commit message description is not capitalized
--

commit 3ae418ca93d0206cc940b490c5c31c35740d2dcd
Author: Wayne Ho <wayneho219@gmail.com>

Documentation: ABI: leds: inverted is specific to the backlight trigger

This commit updates the documentation for the inverted attribute in the
LED subsystem to clarify that it is now only created by the backlight
trigger. It drops the outdated reference to the gpio trigger.

> Documentation: ABI: leds: inverted is specific to the backlight trigger

[Severity: Low]
This isn't a bug, but does the commit subject line violate the LED
subsystem capitalization guidelines? The description portion after the
subsystem prefix is expected to be capitalized, meaning "inverted" should
be "Inverted".

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001-docs-leds-=
abi-trigger-attrs-v1-0-54f0529bf0f6@gmail.com?part=3D1
