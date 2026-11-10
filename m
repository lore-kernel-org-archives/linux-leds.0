Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794336450;
	b=2qaLzabVAq4aJ5fiJ/BP6j5bg1mkxAeaBkrO6Q16fM73XB2/Yf5FUzIPM9KxBhYSqJBQ
	 eTjclAaF2pRQT/EglwUZ7bX4B2LXZ+iwNJj9F1ERwBYZMdA/DXgDnRYujg+BTy/uIolZ1
	 oVwuMbYuqahXbtF0WFEsPv5QY7ga0LbwCnhSETPS1LRMIBXBg1WdyHoPqHa7ANZlcRxmM
	 LXYbTXLtLiywP7H1/wYF0IXVuZhqKz9g5y1I1IqMEY6GzdQNV3XEkyQ6BYYTVnVUH6/Kp
	 IyxCrOvWgkZCKYNe9R1Yc3oQcNej7TKgB9RH/aJ5/gH1kBomIQleu8jbOAvrwy6Zgig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794336450;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=UT2gLV5FGgiP6kwaq8cnLxzBjRd5Y1CkQ+IRBcCEKdQ=;
	b=o143asyHR6YAP3/ttEFZ68gbVc4ICau4lJ7l6Sbt+fbCmjW9SbJ3qs+D56Y27fdWUVu9
	 43IibaIc9/iKnUXCeQ+8U4Q0UFiAfPwJo8571FVq0PzTSntEkpdNwrgMJxWxQ8jkR7dcU
	 3qqtNErVRUvLg840wOl2+myynpxleK62R3Ag2Q6Y5FGjt0e7tnL03pjUhAct5zD4++dTG
	 F5dBRimUyqJQko+vrV38sJG/BrAMgkZ6inHuKEopX7N7Dp95bKjeBLNoVBZy9TaZefQyD
	 PxeDi0R43I4HuNYbQiRYZZ/5Fmna+7D7HIqMYkH3+ebhTuU0dQXspkHbt/JUQUY5OsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QD2vI+cc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E4E606A31C;
	Tue, 10 Nov 2026 18:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QD2vI+cc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6D061F0089F;
	Tue, 10 Nov 2026 18:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794336450;
	bh=UT2gLV5FGgiP6kwaq8cnLxzBjRd5Y1CkQ+IRBcCEKdQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QD2vI+ccVgXfufW29NN/Q7Sd2LmuFcLBbn0dfvDO8yXHqIiUUkCc+2r6rguIiikCq
	 9rv89lh62pPWa1QZhA5AqCk5rEOIJx7qxhOZzSLDshV/9fPzjPnlFhjGblWfK4ETP7
	 3pldTDR04CBoMgXF71/YbWbLV9NDKrFogVl9WFEFPrHQtYC5CCkcJLzQ56SWrzRclA
	 hsWTCIkcnI5elbs5ECPVM1C9Kjpd1W105+Z0bb8L+zx7Nk4OsyA0F2IrDtzCqgvbgq
	 h9xPkq3/vUyIstSbBuwOPgyXDBAWLt/3D/bKfAukizs3YOLA8G2oklvXZQtZvagqHZ
	 hmn672Q6PpzMw==
Date: Tue, 10 Nov 2026 12:47:26 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, Pavel Machek <pavel@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>, mfd@lists.linux.dev,
	Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v5 1/3] regulator: dt-bindings: maxim,max8907: Document
 LED support
Message-ID: <179433644614.1303784.4316936152002479341.robh@kernel.org>
References: <20261108151348.204182-1-clamor95@gmail.com>
 <20261108151348.204182-2-clamor95@gmail.com>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261108151348.204182-2-clamor95@gmail.com>


On Sun, 08 Nov 2026 17:13:46 +0200, Svyatoslav Ryhel wrote:
> The Maxim MAX8907 PMIC supports a single LED; document it.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../devicetree/bindings/regulator/maxim,max8907.yaml          | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

