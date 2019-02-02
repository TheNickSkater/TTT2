if CLIENT then
	function HUDELEMENT:DrawBg(x, y, w, h, c)
		DrawHUDElementBg(x, y, w, h, c)
	end

	function HUDELEMENT:DrawLines(x, y, w, h)
		DrawHUDElementLines(x, y, w, h)
	end

	-- x, y, width, height, color, progress, text
	function HUDELEMENT:DrawBar(x, y, w, h, c, p, t)
		if p ~= 0 then
			surface.SetDrawColor(clr(c))
			surface.DrawRect(x, y, w * p, h)

			-- draw lines around this bar
			self:DrawLines(x, y, w * p, h)
		end

		-- draw text
		self:ShadowedText(t or "", "PureSkinBar", x + 14, y + 5, COLOR_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
	end

	function HUDELEMENT:ShadowedText(text, font, x, y, color, xalign, yalign)
		draw.SimpleText(text, font, x + 2, y + 2, COLOR_BLACK, xalign, yalign)
		draw.SimpleText(text, font, x, y, color, xalign, yalign)
	end

	HUDELEMENT.roundstate_string = {
		[ROUND_WAIT] = "round_wait",
		[ROUND_PREP] = "round_prep",
		[ROUND_ACTIVE] = "round_active",
		[ROUND_POST] = "round_post"
	}
end
