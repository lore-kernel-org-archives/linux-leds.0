Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D0E438012;
	Wed, 12 Aug 2026 12:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786536911; cv=none; b=AZxqU81vSnPSBD5yet1VatOKvqUl8OXROY3ZgVWOKPgTixx6/9x9ECVn61eeE+c96e8stMlViS1EkmQLxDs+OX4/B3KnEBGcC/6DsSNUYIPXq0jW5+cq8yQt9lPFUVzpMmZA0VEoqHS71wqHZXYvPpqrJ7XSTXJxHs60pbJ4FTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786536911; c=relaxed/simple;
	bh=3uG9RYN8zPJ1bU9ywW/F4onnxi9LOIcdi3D48LW3BhM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OuyzrQiGYUM+qTtuhFU1PJU4M2o2wmOL5pEgTOaXPPD9QUSbgK0tvqWH7AZgCY5QK3X7kO1VqUb619YU5m6bl3BFRyQZIof6nRSGbbSNCqotzn9EEditVgTacoKXkrcCbydDb9Rt29V8BnNR2AGCiB/N+QOB/BndBy/NasLW1xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OMH5SxDP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OMH5SxDP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59B651F00A3A;
	Wed, 12 Aug 2026 12:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786536909;
	bh=7Z+XzXDfYwobWJxYpx8R2juvCXyCYa2UzJFRERKyDxA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=OMH5SxDPZnlWw+o96gNmfx+bFpk5Q6i3bpnpv/MigtRYzSpTFekAXyDRXH5R/cUev
	 9HKmFlw1NIXl37AGD93E/NKzElwkslxfP+7luOyANSMZ2Pt592nPH77mVD2mQoGpRx
	 7+BP3X3/w9mhcMACZ8+m1zCKmNJLalIZl78aw9c8zbjCFGPMWfv+zq3BreAi4ikl0f
	 pLgiOyarMTKiWOAo2UIaOAAMSiykwvnRuYPiXnrHprxldfag+T6FqaOeZ4V7jcVrOZ
	 S8vuMJz+jlfrFyPrfMjIGWHZLG5YqwMkHR9ZO60lQZLxGidn+wMh7dm1wsW7Af2RTR
	 HVGLMpgGGtR9Q==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Junjie Cao <junjie.cao@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Pengyu Luo <mitltlatltl@gmail.com>
In-Reply-To: <20260804030255.1934470-1-junjie.cao@intel.com>
References: <20260804030255.1934470-1-junjie.cao@intel.com>
Subject: Re: [PATCH v3 0/3] backlight: aw99706: DT parsing and blank state
 fixes
Message-Id: <178653690808.1388789.8898275020570409827.b4-ty@b4>
Date: Wed, 12 Aug 2026 13:15:08 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Tue, 04 Aug 2026 11:02:52 +0800, Junjie Cao wrote:
> The driver reads its tuning properties under names the binding does not
> define (patch 1), the validation paths accept values the binding forbids
> (patch 2), and update_status() ignores the blank state, leaving bl_power
> inoperative (patch 3).
> 
> v3:
> - patch 2: reject 0 for awinic,sw-freq-hz (reserved-slot marker
>   collided with it); add Fixes tag
> - patch 3: add stable tag
> v2: only patch 1/3 reached the lists (outbound mail failure):
>     https://lore.kernel.org/all/20260803141310.1379194-2-junjie.cao@linux.dev/
> v1: https://lore.kernel.org/all/20260701133918.33487-1-junjie.cao@linux.dev/
> 
> [...]

Applied, thanks!

[1/3] backlight: aw99706: Fix DT property names to match binding
      commit: daf120e464386f750b3870dc04d5bc6a786f0000
[2/3] backlight: aw99706: Validate all DT property values consistently
      commit: 3d142b19b09ea62d6e9a33d46d1b858b3ad05707
[3/3] backlight: aw99706: Honor the core blank state in update_status()
      commit: fbf8b5d251e8b4e1b01c591be313c63cb9e1526a

--
Lee Jones [李琼斯]

