Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0382739DBF0;
	Mon, 30 Mar 2026 07:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774854159; cv=none; b=Bbxbac8LD9R0iNrSTJyd6V8BxDzzXdhvxnPkpITiQkGUu5D8ZAm8pfJh5gVNummMjg6Oe61k8aMrE6KMxKDVAmCWUgdOvqFG9ZvBo9zMc1iobyrgsVfd/ADk1ziKQD0JPMKVm+wyrdenGICM5lh/O4odt1JaOQKKO6AWiE/knx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774854159; c=relaxed/simple;
	bh=/aKPe1Ur53X6qPfzqxNI8rbi97LWPJBXgD7FZtrLl8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RizUwULkQyDl8A+1thc2iMoCZqyhrGM1TmcYrl4lFFLwKVZYyonul1b0/y/Qqqdo/t4xhdGHJ8B5+ph4Y4PynzP4uIAtZ+q04a+JycoMmBuTfd+LaBrpATHgR8S1mdz5DHrQDFhpfWHmtA2wVz+o/5kLXAxE4qBihZ+6ZAf2B+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ofTSh9WC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ofTSh9WC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08DD1C4CEF7;
	Mon, 30 Mar 2026 07:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774854158;
	bh=/aKPe1Ur53X6qPfzqxNI8rbi97LWPJBXgD7FZtrLl8I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ofTSh9WClhf93gNpLUcgI0newDwVdXFiPgbW4/KVPVxRIRA3vki40QCeXmTJA4r39
	 UX9WFYcgfSBnpAsMksd9umuI4evMb45F08na7nimjqoe5d5fK+ikODEwAb7zZWwG5S
	 e7jJ81UwDorwWnFFsuXlHaa9cVhPh/UBhKzGa+APCQYBidJaxmJ6qHkFtxw/GIaVb8
	 vbfqmtT+EpyzOnYw8W6oZ8HrgcNKbOzl3PCX24N5FlVTw7gjRBmMpnkP2w3fBwWSZw
	 58OBYoEXPYI2Cz2Hcc/BFCoGgBxNi5XCOY9+XHyjqQgALyubNUF2eTXeR4Df1LJ24s
	 ikBeQw3rNsANw==
Date: Mon, 30 Mar 2026 09:02:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Markus Probst <markus.probst@posteo.de>
Cc: Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Len Brown <lenb@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: Re: [PATCH v5 3/4] rust: add visibility to of_device_table macro
Message-ID: <20260330-statuesque-hypnotic-labrador-ef5db1@quoll>
References: <20260329-synology_microp_initial-v5-0-27cb80bdf591@posteo.de>
 <20260329-synology_microp_initial-v5-3-27cb80bdf591@posteo.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260329-synology_microp_initial-v5-3-27cb80bdf591@posteo.de>

On Sun, Mar 29, 2026 at 08:02:17PM +0200, Markus Probst wrote:
> Add visibility argument to macro to allow defining an of device table in
> a different module than the driver, which can improve readability.

No. The of_device_id table must be always placed next to the foo_driver.
You keep introducing completely inconsisting styles in this patchset,
like completely broken usage of compatibles in the driver.

Best regards,
Krzysztof

