Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A654287247;
	Wed,  7 Oct 2026 20:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791405821; cv=none; b=HLFn/5aGCcAaCVSqGvLK7M7sGaU2Of71SC/41l8ox9X5tGxIWoQhRf1t93T91M419gihrA+o1pg+8D+/78g8W0c5z5a2dQ6hvADqwDEInESISiv9CVAuE4P6VdMWrdIYwuiE7BMbwMyKgAmIPc60Ql5R/KOUaw7L7PDuUVm+NYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791405821; c=relaxed/simple;
	bh=1HeaTyuULnXLP5GijTYrQd+nqswhrFhX9vxXhhvTBZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CNGnk5NYePiB7QhNyKvmLlr2niCqVV/DaFEabnD0iaaqFZqF+rg+C/1NNJ/xdnnG9lhjLpsqDUnt7OVdMLl3zJWQxKExDPcEIbiOj4tXnlUJQIWFqJDxCSIKzE9n3KyN+ttVnKWEG+4YLLWUH02nulXaz3VPgyXG+CATDhQDJZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V1zgYIyH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V1zgYIyH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC5151F000FF;
	Wed,  7 Oct 2026 20:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791405820;
	bh=hHRoN6abmHiNB1qZgW4S4MMeL3PvY+PAJnenswJ13Ic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=V1zgYIyHlhJ22TmlcIkJt6ucc7zPHFMcq3/+PYIgdXmzYQBbAjOgBK2cOOywShT1P
	 xmWICq+mmDUPYB4pjuiI9c6P3aX2jpa99ieP4V+Or6hXiAc7xu/TZHx3c+UzqcvTKp
	 x0rUrH3iLHHI/QifyRfKA0ZuiWWPflsHAQuhEQedcW7GLxcckF7Ui+GR1f/rcHe+Gm
	 HYBIqY9nwcc0k9d8xRUxT+/7czKU8kHXsbXUrUJ9JuNuM+KrmUqa1fGwAzR0/oLMd3
	 rL1oOA55v3e74rnEvm3NxndQ1/eCwd+n5SWq4Xi97Ye+rYd/reZkxvVnWyosUrKi9F
	 Z4ftEnUSAPSaA==
Date: Wed, 7 Oct 2026 15:43:39 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Udaya Kiran Challa <challauday369@gmail.com>
Cc: devicetree@vger.kernel.org, lee@kernel.org, me@brighamcampbell.com,
	conor+dt@kernel.org, linux-leds@vger.kernel.org, krzk+dt@kernel.org,
	pavel@kernel.org, skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: leds: lacie,netxbig-leds: Convert to
 DT schema
Message-ID: <179140581871.231389.13195725520497742946.robh@kernel.org>
References: <20261005184428.251868-1-challauday369@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005184428.251868-1-challauday369@gmail.com>


On Tue, 06 Oct 2026 00:14:28 +0530, Udaya Kiran Challa wrote:
> Convert lacie,netxbig-leds devicetree binding from legacy
> text format to DT schema.
> 
> Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
> ---
> Changelog:
> Changes since v3:
> - Correct patternProperties to use generic led node names
> - Rename example device name to leds
> - Drop optional subnode properties
> 
> Link to v3:https://lore.kernel.org/all/20260901170358.176103-1-challauday369@gmail.com/
> 
> Changes since v2:
> - Add reference to led common.yaml
> - Drop type for all common properties
> 
> Link to v2:https://lore.kernel.org/all/20260821123723.198286-1-challauday369@gmail.com/
> 
> Changes since v1:
> - Use pattenProperties for LED child nodes instead of additionalProperties
> - Explicitly list the two optional properties supported by the binding
> - Place the top-level required block after child-node definition
> 
> Link to v1:https://lore.kernel.org/all/20260820150223.108374-1-challauday369@gmail.com/
> ---
>  .../bindings/leds/lacie,netxbig-leds.yaml     | 136 ++++++++++++++++++
>  .../devicetree/bindings/leds/leds-netxbig.txt |  92 ------------
>  2 files changed, 136 insertions(+), 92 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml
>  delete mode 100644 Documentation/devicetree/bindings/leds/leds-netxbig.txt
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

