Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7742E1722;
	Wed,  6 May 2026 19:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778096572; cv=none; b=M83ezCn+1zWTlFsa4eWrS5R91v2XLoLACFICK1HhQiiTAeT19wKP1gF2dcJv1+VBUk3qPJCkKIPDEyseBQf2bQWASxyUAUur88W3yXixrlNGBjaJyJeqb44S4dhL2B06tNfPo2uMUDCZKwXJX1/8jeI626W+oWlfJ8zxygqQ2+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778096572; c=relaxed/simple;
	bh=3ROQhKBMqGZa4J8zWB0gtWFkp7WffPdiqeh3o40NAUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SKVt7cSlddPS+WSdhPHM6YFyAZ8t/ro0elyU2jkp8ScepXF3ncCxxyYC+cgUHek6E5pnsokgdwWnSJHv8G1ap7fKt0acroeXFiLLOklfpgzqs5xz4W6Wt2lGp6vxbYNOIOCIWY1BycQ1+eN9BALGi31Ft4XUXbxY4DzzdA626Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FuneFUWW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FuneFUWW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E237FC2BCB0;
	Wed,  6 May 2026 19:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778096572;
	bh=3ROQhKBMqGZa4J8zWB0gtWFkp7WffPdiqeh3o40NAUE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FuneFUWW5qPivTjUlTiv+IdFgTPUMjbTVCAhUxy2CutXuXqKOWwAEY/xX+RYquqM2
	 HEtO1JvmQAbjUfgguxB/PkbObaBESsTPBYgx8pF41hnUsPiH3XYtntS4Xa+wsdxGMm
	 fiUXX4JdjLDZTrVM50DF6r1EUp9VVf/HCWlNMT71n/wrXY33Zbd00Cpf23rg20U/Rm
	 yr0mYL5RuQagJz6F6DfTPyvswNs/Z/FRCIqa+ep2JzmeTBWftEddRDBH8ZHs0MXfPg
	 fStWeu4Vrq5z+c6S9gwaBYyHRM0jgQGMOsQGx5BNs+edsfJwLSx8KTZEBj0td7P0+5
	 6U1cmd6rbrGuQ==
Date: Wed, 6 May 2026 14:42:49 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jun Yan <jerrysteve1101@gmail.com>
Cc: linux-kernel@vger.kernel.org, pzalewski@thegoodpenguin.co.uk,
	lee@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	daniel@zonque.org, linux-leds@vger.kernel.org,
	luccafachinetti@gmail.com, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/5] dt-bindings: leds: leds-is31fl32xx: Add
 powerdown-gpios property
Message-ID: <177809656918.2995969.7607110407322138109.robh@kernel.org>
References: <20260429154449.730880-1-jerrysteve1101@gmail.com>
 <20260429154449.730880-4-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429154449.730880-4-jerrysteve1101@gmail.com>


On Wed, 29 Apr 2026 23:44:47 +0800, Jun Yan wrote:
> The IS31FL32XX series features an SDB shutdown pin.
> Driving it low (active low) places the chip into hardware shutdown mode
> for power saving, while all register contents are preserved
> and registers are not reset.
> 
> Add powerdown-gpios property to describe the GPIO connected to the
> SDB pin of IS31FL32XX series LED controllers.
> 
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> ---
>  .../devicetree/bindings/leds/issl,is31fl32xx.yaml    | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

