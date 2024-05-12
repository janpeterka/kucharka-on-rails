import { application } from "controllers/application"

import ClickableController from "controllers/clickable_controller"
application.register("clickable", ClickableController)

import FormController from "controllers/form_controller"
application.register("form", FormController)

import SortableController from "controllers/sortable_controller"
application.register("sortable", SortableController)

import LabelBadgeController from "controllers/label_badge_controller"
application.register("label-badge", LabelBadgeController)

import InputValueController from "controllers/input_value_controller"
application.register("input-value", InputValueController)

import Clipboard from 'stimulus-clipboard'
application.register('clipboard', Clipboard)
