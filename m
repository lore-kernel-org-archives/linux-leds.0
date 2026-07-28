Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5373890FB;
	Tue, 28 Jul 2026 07:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785225281; cv=none; b=AQCoFJ6sDDBk2N6i2jnkO6KNjjyOdAerL3MyUrTPxkdfchMgqHGcFjaeP5GSlCrtINCWt/i+RB0/HzXXHecOcyFz1cK0sZarB9+DN4Wb/mMhfxkp71ntvAe5DQfJmCRH2jxDTaBfuXdGHLh1wuO2zOYdb7XLDyDlkLBkO0MDQqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785225281; c=relaxed/simple;
	bh=fjFtTsOC9F2ZqTi+zg1L+s5U9xo86YAupivgEhei9x0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nYxsgA/DwsKYiOIEvuVT8RRCJ56bj9e01uTCyfHtPLUHOB2ktPbKu79OTdzqbk4Ew+o2sJKl5sNQwOtFfMOEEI1D4hKXK4/erFBJING61qo0J8tTz/Soz3LAu+3bYlWFTfd8wLKXAnx1Fgn8FT8onkDp2LpCWqR3zDJwjrYbLY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a6w25LPW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a6w25LPW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 214751F000E9;
	Tue, 28 Jul 2026 07:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785225280;
	bh=RvTVxjQnBUnqZli/I2KNcRbWD4gRVfujSkS9xYm3nKw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a6w25LPW7nsFj3L93QRsVQ+VbCfQHqQEQ3SQgSD/vORg35oTZ6bQJKB41yx0H89lr
	 CoARQQ63BtOgfYnbXwj/+SWfBU2Kz5hISnGbk5D0pwLTWX/mIQeTAWnR2A3PEi9eFi
	 8LpKE2FknAsglyUUA9d0e1Sj8hxP/SjkFGqdFX8xeCxlDAemnD5d2IFZfmRZ5m8UL3
	 g8KdEmYCQI3L4tFBAJGRdIrgFiwbVKbQIo2FVVmyQV5X8lqmTT21wNVhy9d+2R+lkI
	 zkHrqWJCT/oTOMXXCE7DcGuZ9BuBZu9GAfEHCsW+YGj96EVTqJopOqDnir7MmhrUYD
	 RL9OpFvMxVcFw==
Date: Tue, 28 Jul 2026 09:54:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ninad Naik <ninadnaik07@gmail.com>
Cc: lee@kernel.org, pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, simon.guinot@sequanux.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, me@brighamcampbell.com, 
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3] dt-bindings: leds: lacie,ns2-leds: Convert to DT
 schema
Message-ID: <20260728-garrulous-wild-jellyfish-a6e0e4@quoll>
References: <20260724162332.32291-1-ninadnaik07@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260724162332.32291-1-ninadnaik07@gmail.com>

On Fri, Jul 24, 2026 at 09:53:32PM +0530, Ninad Naik wrote:
> Convert lacie,ns2-leds to DT schema.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/r/202607231542.6ovJrInT-lkp@intel.com/

Drop both. You need to read that report again.

> Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
> ---
> Changes in v3:
> - Add optional property num-modes to the schema.

Missing rest of the changelog.

What happened here?

Rest looks good, so with dropping incorrect tags (really, please read
the email you received):

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

