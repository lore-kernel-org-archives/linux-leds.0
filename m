Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5862E1722;
	Wed,  6 May 2026 19:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778096547; cv=none; b=DXJtpJOPj88upr3dOzvABiMub5wT8eezDzHRnk4debbzcACiN1KBJWh2va68oMB6L+kKld1s2i3kbFFcdaHDIAYjV7tPQ8Di5nNB3hI3KFus8UKR5i8gdTQaSOKaJL34wNaXccqFX8B0TGj5dEYMuS2vo1k+ZMQKGs520qINDxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778096547; c=relaxed/simple;
	bh=GtQzMB+4Oterdsc4GMusv+cdB2qzVdC7/5Y7nEz8IT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p0xYISIVARNzrxm11mlx+3+VBBAnYr7rzWRVI72uq6Vt+iW5HC9APi7JiOx5zSqtmKWp9l9BbU84yxOfdHaPhEZJKQseFuV52Wo9GmfpBz4RlbVzIE1FV0OLK7iWMtVS4//0kY43N/FRlbbhgAkgCgNz+VyY9R9XS76r+D93yNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bxmVUPS2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bxmVUPS2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D97C6C2BCB0;
	Wed,  6 May 2026 19:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778096547;
	bh=GtQzMB+4Oterdsc4GMusv+cdB2qzVdC7/5Y7nEz8IT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bxmVUPS2HlkZ1AGWRitf8QqI64Uv+GPsAQ4xZkMR8WCtJyQxWSUD4q65x26SkeCBL
	 21r3UQacsaE4d6YBmK59yWFJorUwVQUeGU8X/uwT8k0uBiOcl0zOmcmT69vLnvkf9i
	 CPI7tbNqSnFhz945fGd7LtTVfLVlLzE3j7+L0HVj6xJ/zg7RhGD3hJAJbp8jrcfuAB
	 yGfTNIziFYaZguhHJjMBkg7nwsrTYwy+/MHK3qlFUL/Vwf4e1Rq5Ah6XB6rBvOGugH
	 MiqaJg8JTalAFFZI5O4wcTsq/c1qvApwshZP3jiCu0UX7wPeB38uXfhMPI1xqckX3W
	 K/8aO2x1Ojlgw==
Date: Wed, 6 May 2026 14:42:24 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jun Yan <jerrysteve1101@gmail.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
	luccafachinetti@gmail.com, lee@kernel.org, krzk+dt@kernel.org,
	pzalewski@thegoodpenguin.co.uk, daniel@zonque.org,
	devicetree@vger.kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v3 2/5] dt-bindings: leds: leds-is31fl32xx: add support
 for is31fl3236a
Message-ID: <177809654440.2995402.2607787723896842009.robh@kernel.org>
References: <20260429154449.730880-1-jerrysteve1101@gmail.com>
 <20260429154449.730880-3-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429154449.730880-3-jerrysteve1101@gmail.com>


On Wed, 29 Apr 2026 23:44:46 +0800, Jun Yan wrote:
> Add an additional and optional control property for setting
> the output PWM frequency to 22kHz that exists on is31fl3236a.
> The default is 3kHz and this option puts the operational frequency
> outside of the audible range.
> 
> Co-developed-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
> Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> ---
>  .../bindings/leds/issl,is31fl32xx.yaml        | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

